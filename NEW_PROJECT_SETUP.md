# New Project Setup

Instructions for an LLM agent to bootstrap a fresh Flutter app that mirrors this
project's architecture, libraries and conventions. The end result is a hello-world
app with two tabs — **Home** and **Sample** — and every library installed and wired up.

Throughout this document, `myapp` is a placeholder for the new package name. Replace
every occurrence with the actual name (lowercase, snake_case). All Dart imports are
absolute — `package:myapp/...` — never relative, except for `part` directives and
sibling imports inside `lib/db/`.

---

## 0. Create the project

```bash
flutter create --org com.example --platforms=android,ios,linux,web myapp
cd myapp
rm -rf test/
```

Delete the generated `test/` directory: this project phase does not use tests
(see §9).

---

## 1. Dependencies

Add all packages in one shot:

```bash
flutter pub add riverpod flutter_riverpod riverpod_annotation \
  go_router shared_preferences drift drift_flutter uuid \
  vector_graphics dynamic_color
flutter pub add --dev build_runner riverpod_generator drift_dev \
  vector_graphics_compiler
```

Resulting `pubspec.yaml` (versions are the ones this project runs; let `pub add`
pick newer compatible ones if available):

```yaml
environment:
  sdk: ^3.12.2

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  riverpod: ^3.3.2
  flutter_riverpod: ^3.3.2
  riverpod_annotation: ^4.0.3
  go_router: ^17.3.0
  shared_preferences: ^2.5.5
  drift: ^2.34.0
  drift_flutter: ^0.3.0
  uuid: ^4.5.1
  vector_graphics: ^1.2.2
  dynamic_color: ^1.8.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
  build_runner: ^2.15.0
  riverpod_generator: ^4.0.4
  drift_dev: ^2.34.0
  vector_graphics_compiler: ^1.2.6
```

Under the `flutter:` section, register the compiled-icon asset directory:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/icons/vec/
```

> The build fails if `assets/icons/vec/` does not exist, so §7 must run at least
> once (or the directory must contain a `.gitkeep`) before `flutter run`.

Keep the default `analysis_options.yaml` (`include: package:flutter_lints/flutter.yaml`).

---

## 2. Directory layout

Create this structure under `lib/`. Data flows strictly through the layers —
**screens never touch the database directly**.

```
lib/
  main.dart                     App entry: init prefs, ProviderScope, MaterialApp.router
  router.dart                   All go_router routes in one place

  db/
    database.dart               AppDatabase — @DriftDatabase, migration strategy
    db_provider.dart            Riverpod provider exposing AppDatabase
    models/                     Drift table definitions (DbSamples, …)

  domain/
    models/                     Plain Dart classes with fromDB() / toDB()
    repository/                 One repository per entity + matching *_provider.dart
    providers/[feature]/        Feature providers the UI consumes (queries + mutations)

  screens/
    home/home_screen.dart
    home/widgets/               Screen-local components
    sample/sample_screen.dart
    sample/widgets/

  utils/
    app_theme.dart              Spacing / radius tokens + buildAppTheme()
  widgets/
    app_shell.dart              Bottom NavigationBar shell
    app_icon.dart               AppIcon widget + AppIcons enum
    empty_section.dart
    error_section.dart

design/icons/                   Source SVGs
assets/icons/vec/               Compiled .vec output (generated)
tool/build_icons.sh
```

Layer rules:

- **db/models** — Drift tables only. Class names prefixed `Db` (`DbSamples`).
- **domain/models** — plain Dart, no Drift types leaking into UI. Each exposes
  `factory X.fromDB(DbX row)` and `DbXCompanion toDB({bool isDirty = true})`.
- **domain/repository** — owns all queries for one entity, takes `AppDatabase` in
  its constructor, returns domain models. Never returns Drift rows.
- **domain/providers/[feature]** — the only thing screens talk to. Read-providers
  fetch via repositories; an `*ActionsProvider` holds mutations and invalidates
  affected read-providers afterwards.

---

## 3. Theme tokens — `lib/utils/app_theme.dart`

Colors are deliberately **not** tokens: UI chrome pulls from
`Theme.of(context).colorScheme`; user-chosen data colors come from a separate
palette. Only spacing and radius are tokenized.

```dart
import 'package:flutter/material.dart';

abstract final class AppSpacing {
  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s24 = 24;
  static const double s32 = 32;
}

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 20;

  static const BorderRadius smAll = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdAll = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgAll = BorderRadius.all(Radius.circular(lg));
}

/// Component-level defaults live here so call sites don't restyle individually.
ThemeData buildAppTheme(ColorScheme colorScheme) {
  return ThemeData(
    colorScheme: colorScheme,
    cardTheme: const CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
    ),
  );
}
```

---

## 4. Database layer

### 4.1 Sync columns

Every syncable table carries these three columns alongside its business columns:

```dart
late final serverVersion = real().withDefault(const Constant(0))();
late final isDirty = boolean().withDefault(const Constant(false))();
late final isDeleted = boolean().withDefault(const Constant(false))();
```

Deletes are soft (`isDeleted = true`); **always** filter
`isDeleted.equals(false)` in list queries. Mutations set `isDirty = true`. The
sync watermark (`lastSyncedVersion`, `needsBootstrap`) lives in SharedPreferences,
not in the DB. Primary keys are UUID v4 strings generated in the repository.

### 4.2 `lib/db/models/samples.dart`

```dart
import 'package:drift/drift.dart';

class DbSamples extends Table {
  late final id = text()();

  late final name = text()();

  late final serverVersion = real().withDefault(const Constant(0))();

  late final isDirty = boolean().withDefault(const Constant(false))();

  late final isDeleted = boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
```

### 4.3 `lib/db/database.dart`

```dart
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'models/samples.dart';

part 'database.g.dart';

@DriftDatabase(tables: [DbSamples])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
        // Seed system rows here if the app needs any.
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'myapp_database');
  }
}
```

### 4.4 `lib/db/db_provider.dart`

```dart
import 'package:myapp/db/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase db(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}
```

---

## 5. Domain layer

### 5.1 `lib/domain/models/sample.dart`

```dart
import 'package:drift/drift.dart';

import 'package:myapp/db/database.dart';

class Sample {
  final String id;
  final String name;

  const Sample({required this.id, required this.name});

  factory Sample.fromDB(DbSample row) => Sample(id: row.id, name: row.name);

  DbSamplesCompanion toDB({bool isDirty = true}) {
    return DbSamplesCompanion(
      id: Value(id),
      name: Value(name),
      isDirty: Value(isDirty),
    );
  }
}
```

### 5.2 `lib/domain/repository/sample_repository.dart`

```dart
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'package:myapp/db/database.dart';
import 'package:myapp/domain/models/sample.dart';

class SampleRepository {
  SampleRepository(this._database);

  final AppDatabase _database;
  final Uuid _uuid = const Uuid();

  Future<List<Sample>> listSamples() async {
    final rows = await (_database.select(_database.dbSamples)
          ..where((s) => s.isDeleted.equals(false))
          ..orderBy([(s) => OrderingTerm.asc(s.name)]))
        .get();

    return rows.map(Sample.fromDB).toList();
  }

  Future<String> createSample({required String name}) async {
    final id = _uuid.v4();
    await _database.into(_database.dbSamples).insert(
          DbSamplesCompanion.insert(
            id: id,
            name: name.trim(),
            serverVersion: const Value(0),
            isDirty: const Value(true),
            isDeleted: const Value(false),
          ),
        );
    return id;
  }

  Future<void> deleteSample({required String id}) async {
    await (_database.update(_database.dbSamples)
          ..where((s) => s.id.equals(id)))
        .write(const DbSamplesCompanion(
          isDeleted: Value(true),
          isDirty: Value(true),
        ));
  }
}
```

### 5.3 `lib/domain/repository/sample_repository_provider.dart`

```dart
import 'package:myapp/db/db_provider.dart';
import 'package:myapp/domain/repository/sample_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_repository_provider.g.dart';

@riverpod
SampleRepository sampleRepository(Ref ref) {
  final db = ref.watch(dbProvider);
  return SampleRepository(db);
}
```

### 5.4 `lib/domain/providers/samples/samples_provider.dart` (read)

```dart
import 'package:myapp/domain/models/sample.dart';
import 'package:myapp/domain/repository/sample_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'samples_provider.g.dart';

@riverpod
Future<List<Sample>> samples(Ref ref) {
  return ref.watch(sampleRepositoryProvider).listSamples();
}
```

### 5.5 `lib/domain/providers/samples/sample_actions_provider.dart` (mutations)

Mutation providers are `keepAlive: true`, expose `FutureOr<void> build() {}` and
invalidate every read-provider their write affects.

```dart
import 'package:myapp/domain/providers/samples/samples_provider.dart';
import 'package:myapp/domain/repository/sample_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_actions_provider.g.dart';

@Riverpod(keepAlive: true)
class SampleActions extends _$SampleActions {
  @override
  FutureOr<void> build() {}

  Future<void> createSample({required String name}) async {
    await ref.read(sampleRepositoryProvider).createSample(name: name);
    ref.invalidate(samplesProvider);
  }

  Future<void> deleteSample({required String id}) async {
    await ref.read(sampleRepositoryProvider).deleteSample(id: id);
    ref.invalidate(samplesProvider);
  }
}
```

---

## 6. App state in SharedPreferences

Prefs are read synchronously through `SharedPreferencesWithCache`, created in
`main()` and injected into the provider graph via an override.

`lib/domain/models/prefs_keys.dart`:

```dart
abstract final class PrefsKeys {
  static const sampleFlag = 'sampleFlag';
}
```

`lib/domain/models/app_state.dart`:

```dart
class AppState {
  final bool sampleFlag;

  const AppState({required this.sampleFlag});

  AppState copyWith({bool? sampleFlag}) =>
      AppState(sampleFlag: sampleFlag ?? this.sampleFlag);
}
```

`lib/domain/providers/app/shared_prefs_provider.dart` — deliberately throws; the
real instance is supplied by the override in `main()`:

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs_provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferencesWithCache sharedPrefs(Ref ref) =>
    throw UnimplementedError('should be initialized in main');
```

`lib/domain/providers/app/app_state_provider.dart` — state updates first, the
write is fire-and-forget:

```dart
import 'package:myapp/domain/models/app_state.dart';
import 'package:myapp/domain/models/prefs_keys.dart';
import 'package:myapp/domain/providers/app/shared_prefs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AppStateNotifier extends _$AppStateNotifier {
  @override
  AppState build() {
    final prefs = ref.read(sharedPrefsProvider);
    return AppState(sampleFlag: prefs.getBool(PrefsKeys.sampleFlag) ?? false);
  }

  void toggleSampleFlag() {
    final next = state.copyWith(sampleFlag: !state.sampleFlag);
    state = next;
    ref
        .read(sharedPrefsProvider)
        .setBool(PrefsKeys.sampleFlag, next.sampleFlag)
        .ignore();
  }
}
```

Every key used by the app must be listed in the cache `allowList` in `main()`.

---

## 7. Icons

SVGs go in `design/icons/`, compiled to `.vec` under `assets/icons/vec/`.

`tool/build_icons.sh`:

```bash
#!/usr/bin/env bash
set -euo pipefail
mkdir -p assets/icons/vec
for f in design/icons/*.svg; do
  name="$(basename "$f" .svg)"
  echo "compiling $name"
  dart run vector_graphics_compiler -i "$f" -o "assets/icons/vec/$name.vec"
done
```

`lib/widgets/app_icon.dart` — the enum lists one entry per SVG filename, so
adding an icon means dropping the SVG in, adding the enum value, and re-running
the script:

```dart
import 'package:flutter/widgets.dart';
import 'package:vector_graphics/vector_graphics.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.icon, this.size = 24, this.color});

  final AppIcons icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return VectorGraphic(
      loader: AssetBytesLoader(icon.assetPath),
      width: size,
      height: size,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}

enum AppIcons {
  sample;

  String get assetPath => 'assets/icons/vec/$name.vec';

  static AppIcons? tryParse(String value) {
    for (final icon in values) {
      if (icon.name == value) return icon;
    }
    return null;
  }
}
```

For the hello-world app, add a single `design/icons/sample.svg` and run
`bash tool/build_icons.sh`.

---

## 8. Navigation, shell and screens

### 8.1 `lib/widgets/app_shell.dart`

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.widgets_outlined),
            selectedIcon: Icon(Icons.widgets),
            label: 'Sample',
          ),
        ],
      ),
    );
  }
}
```

### 8.2 `lib/router.dart`

All routes live in this one file. Tabs are `StatefulShellBranch`es of a single
`StatefulShellRoute.indexedStack`, so each tab keeps its own navigation stack.
Sub-screens of a tab are nested `routes:` of that tab's root route.

**Ordering rule:** a literal path segment (`edit`) must be declared *above* a
parameterized sibling (`:id/edit`), otherwise the literal is matched as an id.

```dart
import 'package:go_router/go_router.dart';

import 'package:myapp/screens/home/home_screen.dart';
import 'package:myapp/screens/sample/sample_screen.dart';
import 'package:myapp/widgets/app_shell.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/sample',
              builder: (context, state) => const SampleScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
```

### 8.3 Shared state widgets

`lib/widgets/empty_section.dart` and `lib/widgets/error_section.dart` — small
widgets used for the empty and error branches of every async section, so those
states look identical across screens.

```dart
// empty_section.dart
import 'package:flutter/material.dart';

import 'package:myapp/utils/app_theme.dart';

class EmptySection extends StatelessWidget {
  const EmptySection({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
      child: Center(
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
```

```dart
// error_section.dart
import 'package:flutter/material.dart';

import 'package:myapp/utils/app_theme.dart';

class ErrorSection extends StatelessWidget {
  const ErrorSection({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
      ),
    );
  }
}
```

### 8.4 Screens

Screens are `ConsumerWidget`s that `ref.watch` feature providers and render
`AsyncValue` with `.when(data:, loading:, error:)`. Padding and gaps use
`AppSpacing`. List screens wrap in a `RefreshIndicator` that refreshes the
providers they watch.

`lib/screens/home/home_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myapp/domain/providers/app/app_state_provider.dart';
import 'package:myapp/utils/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateNotifierProvider);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.s16),
        children: [
          Text('Hello, world', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.s12),
          SwitchListTile(
            title: const Text('Sample flag (persisted)'),
            value: appState.sampleFlag,
            onChanged: (_) =>
                ref.read(appStateNotifierProvider.notifier).toggleSampleFlag(),
          ),
        ],
      ),
    );
  }
}
```

`lib/screens/sample/sample_screen.dart` — exercises the full DB → repository →
provider → UI path:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:myapp/domain/providers/samples/sample_actions_provider.dart';
import 'package:myapp/domain/providers/samples/samples_provider.dart';
import 'package:myapp/utils/app_theme.dart';
import 'package:myapp/widgets/empty_section.dart';
import 'package:myapp/widgets/error_section.dart';

class SampleScreen extends ConsumerWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final samplesValue = ref.watch(samplesProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref
            .read(sampleActionsProvider.notifier)
            .createSample(name: 'Sample ${DateTime.now().second}'),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(samplesProvider.future),
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.s16),
          children: [
            Text('Samples', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: AppSpacing.s12),
            samplesValue.when(
              data: (samples) {
                if (samples.isEmpty) {
                  return const EmptySection(text: 'No samples yet.');
                }
                return Column(
                  children: [
                    for (final sample in samples)
                      ListTile(
                        key: ValueKey(sample.id),
                        title: Text(sample.name),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () => ref
                              .read(sampleActionsProvider.notifier)
                              .deleteSample(id: sample.id),
                        ),
                      ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) =>
                  const ErrorSection(text: 'Could not load samples.'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 8.5 `lib/main.dart`

`main()` is async: it initializes the prefs cache before `runApp` and injects it
through a `ProviderScope` override. `DynamicColorBuilder` supplies the
wallpaper-derived scheme on Android 12+, with a seeded fallback elsewhere.

```dart
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:myapp/domain/models/prefs_keys.dart';
import 'package:myapp/domain/providers/app/shared_prefs_provider.dart';
import 'package:myapp/router.dart';
import 'package:myapp/utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: {PrefsKeys.sampleFlag},
    ),
  );

  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dark-only by design. Wallpaper-derived scheme on Android 12+,
    // seeded fallback elsewhere.
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp.router(
        title: 'MyApp',
        debugShowCheckedModeBanner: false,
        theme: buildAppTheme(
          darkDynamic ??
              ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
              ),
        ),
        routerConfig: router,
      ),
    );
  }
}
```

---

## 9. Project conventions to carry over

Copy these into the new project's `CLAUDE.md`.

**No migrations during development.** The app is assumed to run on a fresh device
every time. Do not write Drift migrations or bump `schemaVersion` — change the
table, regenerate, reinstall. There is no production data to preserve.

**No tests during this phase.** Behavior changes too fast for them to pay off. No
`test/` directory; don't create one unless asked.

**Generated files are committed.** `*.g.dart` for both Drift and Riverpod is
checked into git.

**Regenerate after:** changing a `@DriftDatabase`, any table class, or any
`@riverpod` provider.

---

## 10. Commands

```bash
# Run the app
flutter run

# Code generation (Drift + Riverpod)
dart run build_runner build --delete-conflicting-outputs

# Watch mode during development
dart run build_runner watch --delete-conflicting-outputs

# Lint
flutter analyze

# Compile SVG icons to .vec assets
bash tool/build_icons.sh
```

---

## 11. Bootstrap order

1. `flutter create`, delete `test/`.
2. Add dependencies (§1) and the `assets/icons/vec/` asset entry.
3. Create the directory skeleton (§2).
4. Write `utils/app_theme.dart` (§3).
5. Write the db layer: table, `database.dart`, `db_provider.dart` (§4).
6. Write the domain layer: model, repository, providers (§5).
7. Write the prefs layer: keys, `AppState`, both providers (§6).
8. Add `tool/build_icons.sh`, one SVG, `app_icon.dart`; run the script (§7).
9. Write `app_shell.dart`, `empty_section.dart`, `error_section.dart`, both
   screens, `router.dart`, `main.dart` (§8).
10. `dart run build_runner build --delete-conflicting-outputs`.
11. `flutter analyze` — must be clean.
12. `flutter run` — verify both tabs render, the Sample tab persists rows across
    restarts, and the Home toggle survives a restart.
