# lamu

Flutter app: Riverpod (codegen) + go_router + Drift + SharedPreferences.

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

## Commands

```bash
flutter run
dart run build_runner build          # Drift + Riverpod codegen
dart run build_runner watch
flutter analyze
bash tool/build_icons.sh             # SVG -> .vec
```
