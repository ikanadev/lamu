import 'package:drift/drift.dart';

import 'package:lamu/db/database.dart';

class Extra {
  final String id;
  final String productId;
  final String name;

  /// Current reference price, in cents of Bs. Sale item extras carry their own
  /// snapshot.
  final int price;
  final String icon;
  final bool isActive;

  const Extra({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.icon,
    required this.isActive,
  });

  factory Extra.fromDB(DbExtra row) => Extra(
        id: row.id,
        productId: row.productId,
        name: row.name,
        price: row.price,
        icon: row.icon,
        isActive: row.isActive,
      );

  DbExtrasCompanion toDB({bool isDirty = true}) {
    return DbExtrasCompanion(
      id: Value(id),
      productId: Value(productId),
      name: Value(name),
      price: Value(price),
      icon: Value(icon),
      isActive: Value(isActive),
      isDirty: Value(isDirty),
    );
  }
}
