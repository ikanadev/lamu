import 'package:drift/drift.dart';

import 'package:lamu/db/database.dart';

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
