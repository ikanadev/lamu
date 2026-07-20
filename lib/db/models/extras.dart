import 'package:drift/drift.dart';

import 'products.dart';

/// An add-on charged on top of a variant's price (nutella, leche). Priced
/// independently of size and flavor.
class DbExtras extends Table {
  late final id = text()();

  late final productId = text().references(DbProducts, #id)();

  late final name = text()();

  /// Cents of Bs.
  late final price = integer()();

  late final icon = text()();

  late final isActive = boolean().withDefault(const Constant(true))();

  late final serverVersion = real().withDefault(const Constant(0))();

  late final isDirty = boolean().withDefault(const Constant(false))();

  late final isDeleted = boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
