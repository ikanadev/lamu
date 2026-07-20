import 'package:drift/drift.dart';

class DbSales extends Table {
  late final id = text()();

  late final soldAt = dateTime()();

  /// Cents of Bs. What the sale should have cost: the sum of every item line
  /// plus its extras, at the prices snapshotted on those lines.
  late final subtotal = integer()();

  /// Cents of Bs. What the seller actually charged. Defaults to [subtotal];
  /// the seller may lower it to give a discount on a large order. The discount
  /// is `subtotal - total` — not stored, always derivable.
  late final total = integer()();

  late final serverVersion = real().withDefault(const Constant(0))();

  late final isDirty = boolean().withDefault(const Constant(false))();

  late final isDeleted = boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
