import 'package:drift/drift.dart';

import 'package:lamu/db/database.dart';

class Product {
  final String id;
  final String name;
  final String icon;
  final bool isActive;

  const Product({
    required this.id,
    required this.name,
    required this.icon,
    required this.isActive,
  });

  factory Product.fromDB(DbProduct row) => Product(
        id: row.id,
        name: row.name,
        icon: row.icon,
        isActive: row.isActive,
      );

  DbProductsCompanion toDB({bool isDirty = true}) {
    return DbProductsCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      isActive: Value(isActive),
      isDirty: Value(isDirty),
    );
  }
}
