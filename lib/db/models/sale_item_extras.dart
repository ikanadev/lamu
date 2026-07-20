import 'package:drift/drift.dart';

import 'extras.dart';
import 'sale_items.dart';

/// An extra charged on one sale item, with its own price snapshot.
class DbSaleItemExtras extends Table {
  late final id = text()();

  late final saleItemId = text().references(DbSaleItems, #id)();

  late final extraId = text().references(DbExtras, #id)();

  /// Cents of Bs.
  late final unitPrice = integer()();

  late final serverVersion = real().withDefault(const Constant(0))();

  late final isDirty = boolean().withDefault(const Constant(false))();

  late final isDeleted = boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
