import 'package:drift/drift.dart';

import 'package:lamu/db/database.dart';

class ProductVariant {
  final String id;
  final String productId;
  final String sizeId;

  /// Null for products with no flavor axis (fresas con crema).
  final String? flavorId;

  /// Current reference price, in cents of Bs. Sale items carry their own
  /// snapshot.
  final int price;
  final bool isActive;

  const ProductVariant({
    required this.id,
    required this.productId,
    required this.sizeId,
    required this.flavorId,
    required this.price,
    required this.isActive,
  });

  factory ProductVariant.fromDB(DbProductVariant row) => ProductVariant(
        id: row.id,
        productId: row.productId,
        sizeId: row.sizeId,
        flavorId: row.flavorId,
        price: row.price,
        isActive: row.isActive,
      );

  DbProductVariantsCompanion toDB({bool isDirty = true}) {
    return DbProductVariantsCompanion(
      id: Value(id),
      productId: Value(productId),
      sizeId: Value(sizeId),
      flavorId: Value(flavorId),
      price: Value(price),
      isActive: Value(isActive),
      isDirty: Value(isDirty),
    );
  }
}
