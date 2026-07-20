# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Product

**LaMu** (Spanish *la* + a cow's *muuuu*) is a small store selling strawberries
with cream, fruit juice and frappés. This app manages the store's earnings and
expenses:

- **Products** — a fixed set, seeded into the DB on create (see the
  `MigrationStrategy.onCreate` in `lib/db/database.dart`). Sales are recorded
  against them.
- **Expenses** — driven by a seeded category list, but the user can also record
  an expense outside that list, so the schema must tolerate free-form entries.
- **Stats tab** — monthly and yearly summaries of earnings vs. expenses. Later
  this grows into deeper analysis (heat maps of sales by hour and by day of
  week), so aggregate queries belong in repositories, not in screens.

Aggregation is SQL's job: sums and groupings live in the repository layer as
Drift queries returning domain models. Screens never compute totals by folding
over a full row list.

## Scaffolding

`Sample` (`DbSamples` table, `SampleRepository`, the samples providers and the
Sample tab) is placeholder bootstrap code demonstrating the full
DB → repository → provider → UI path. Replace it with real entities; don't build
features on top of it. `AppIcons.sample` / `design/icons/sample.svg` likewise.

Flutter 3.44 / Dart 3.12. Riverpod (codegen) + go_router + Drift + SharedPreferences.

## Architecture

Data flows strictly through the layers — **screens never touch the database directly**.

```
lib/
  main.dart          init prefs, ProviderScope, MaterialApp.router
  router.dart        all go_router routes in one place
  db/                Drift tables (models/), AppDatabase, db_provider
  domain/
    models/          plain Dart, fromDB() / toDB()
    repository/      one repository per entity + *_provider.dart
    providers/[f]/   the only thing screens talk to (reads + *ActionsProvider)
  screens/[f]/       ConsumerWidgets + widgets/ subfolder
  utils/app_theme.dart
  widgets/           app_shell, app_icon, empty_section, error_section
design/icons/        source SVGs
assets/icons/vec/    compiled .vec output
```

- **db/models** — Drift tables only, class names prefixed `Db` (`DbSamples`).
- **domain/models** — no Drift types leak to the UI; `X.fromDB(DbX row)` and
  `DbXCompanion toDB({bool isDirty = true})`.
- **domain/repository** — owns all queries for one entity, takes `AppDatabase`,
  returns domain models, never Drift rows.
- **domain/providers/[feature]** — read providers fetch via repositories; an
  `*ActionsProvider` holds mutations and invalidates affected read-providers.

All Dart imports are absolute (`package:lamu/...`) — never relative, except
`part` directives and sibling imports inside `lib/db/`.

## Conventions

**Language.** All user-facing text is in Spanish — screen labels, buttons, empty
and error states, validation messages, seeded product and expense-category
names. Everything else is in English: identifiers, file and folder names, code
comments, commit messages, and this documentation.

**Money.** The currency is the Bolivian boliviano (Bs). Every monetary value —
prices, sale totals, expense amounts — is stored and passed around as a whole
number of **cents**, in `integer()` columns and `int` Dart fields. Never `real()`
or `double`: floating point does not sum cleanly, and these values get
aggregated. Convert to Bs only at the display edge, in a formatter.

**Sync columns.** Every syncable table carries `serverVersion`, `isDirty`,
`isDeleted`. Deletes are soft — always filter `isDeleted.equals(false)` in list
queries; mutations set `isDirty = true`. The sync watermark lives in
SharedPreferences, not the DB. Primary keys are UUID v4 strings generated in the
repository.

**Theme tokens.** Only spacing and radius are tokenized (`AppSpacing`,
`AppRadius`). UI chrome pulls colors from `Theme.of(context).colorScheme`.

**Prefs.** Read synchronously via `SharedPreferencesWithCache`, created in
`main()` and injected by overriding `sharedPrefsProvider`. Every key must be
listed in the cache `allowList` in `main()`.

**No migrations during development.** The app is assumed to run on a fresh
device every time. Do not write Drift migrations or bump `schemaVersion` —
change the table, regenerate, reinstall.

**No tests during this phase.** No `test/` directory; don't create one unless
asked.

**Generated files are committed.** `*.g.dart` for both Drift and Riverpod is
checked into git.

**Regenerate after:** changing a `@DriftDatabase`, any table class, or any
`@riverpod` provider.

**Codegen naming.** riverpod_generator 4 strips a `Notifier` suffix from class
providers: `class AppStateNotifier` generates `appStateProvider`, not
`appStateNotifierProvider`. Check the `.g.dart` for the real symbol rather than
guessing. Drift generates the row class singular (`DbSample` for table
`DbSamples`) plus `DbSamplesCompanion`.

## Commands

```bash
flutter run                          # linux desktop is the connected device
dart run build_runner build          # Drift + Riverpod codegen
dart run build_runner watch
flutter analyze                      # must be clean
bash tool/build_icons.sh             # design/icons/*.svg -> assets/icons/vec/*.vec
```

`--delete-conflicting-outputs` is accepted but ignored by build_runner 2.15+.
The build fails if `assets/icons/vec/` is empty or missing, since it is
registered as an asset directory in `pubspec.yaml`.

No test commands: this phase has no `test/` directory by design (see above).
