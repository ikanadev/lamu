import 'package:drift/drift.dart';

import 'package:lamu/db/database.dart';

class SaleItemExtra {
  final String id;
  final String saleItemId;
  final String extraId;

  /// Price snapshot in cents of Bs, taken when the sale was recorded.
  final int unitPrice;

  const SaleItemExtra({
    required this.id,
    required this.saleItemId,
    required this.extraId,
    required this.unitPrice,
  });

  factory SaleItemExtra.fromDB(DbSaleItemExtra row) => SaleItemExtra(
        id: row.id,
        saleItemId: row.saleItemId,
        extraId: row.extraId,
        unitPrice: row.unitPrice,
      );

  DbSaleItemExtrasCompanion toDB({bool isDirty = true}) {
    return DbSaleItemExtrasCompanion(
      id: Value(id),
      saleItemId: Value(saleItemId),
      extraId: Value(extraId),
      unitPrice: Value(unitPrice),
      isDirty: Value(isDirty),
    );
  }
}
