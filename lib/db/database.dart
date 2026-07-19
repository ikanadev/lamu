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
    return driftDatabase(name: 'lamu_database');
  }
}
