import 'package:drift/drift.dart';

import 'flavors.dart';
import 'products.dart';
import 'sizes.dart';

/// One sellable combination of a product: its size, and — for frapés and
/// juices — its flavor. [price] is the current reference price; sale items
/// snapshot their own.
class DbProductVariants extends Table {
  late final id = text()();

  late final productId = text().references(DbProducts, #id)();

  late final sizeId = text().references(DbSizes, #id)();

  /// Null for products with no flavor axis (fresas con crema).
  late final flavorId = text().nullable().references(DbFlavors, #id)();

  /// Cents of Bs.
  late final price = integer()();

  late final isActive = boolean().withDefault(const Constant(true))();

  late final serverVersion = real().withDefault(const Constant(0))();

  late final isDirty = boolean().withDefault(const Constant(false))();

  late final isDeleted = boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
