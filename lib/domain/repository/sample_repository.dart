import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'package:lamu/db/database.dart';
import 'package:lamu/domain/models/sample.dart';

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
    await (_database.update(_database.dbSamples)..where((s) => s.id.equals(id)))
        .write(const DbSamplesCompanion(
      isDeleted: Value(true),
      isDirty: Value(true),
    ));
  }
}
