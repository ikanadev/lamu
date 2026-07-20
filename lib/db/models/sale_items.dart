import 'package:drift/drift.dart';

import 'product_variants.dart';
import 'sales.dart';

/// A line on a sale. [unitPrice] is a snapshot — the variant's reference price
/// may change later without rewriting history.
class DbSaleItems extends Table {
  late final id = text()();

  late final saleId = text().references(DbSales, #id)();

  late final variantId = text().references(DbProductVariants, #id)();

  late final quantity = integer().withDefault(const Constant(1))();

  /// Cents of Bs.
  late final unitPrice = integer()();

  late final serverVersion = real().withDefault(const Constant(0))();

  late final isDirty = boolean().withDefault(const Constant(false))();

  late final isDeleted = boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
