import 'package:drift/drift.dart';

class DbSizes extends Table {
  late final id = text()();

  late final name = text()();

  /// Relative magnitude of the size, used to order sizes from smallest to
  /// largest. Seeded with gaps so a Mediano can slot between existing values
  /// without touching them. See `lib/db/seed.dart`.
  late final reference = integer()();

  late final serverVersion = real().withDefault(const Constant(0))();

  late final isDirty = boolean().withDefault(const Constant(false))();

  late final isDeleted = boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
