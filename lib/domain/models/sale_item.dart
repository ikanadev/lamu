import 'package:drift/drift.dart';

import 'package:lamu/db/database.dart';
import 'package:lamu/domain/models/sale_item_extra.dart';

class SaleItem {
  final String id;
  final String saleId;
  final String variantId;
  final int quantity;

  /// Price snapshot in cents of Bs, taken when the sale was recorded.
  final int unitPrice;
  final List<SaleItemExtra> extras;

  const SaleItem({
    required this.id,
    required this.saleId,
    required this.variantId,
    required this.quantity,
    required this.unitPrice,
    this.extras = const [],
  });

  /// What this line contributed to the sale total, in cents: the variant plus
  /// its extras, all at their snapshotted prices.
  int get lineTotal {
    final extrasPerUnit =
        extras.fold<int>(0, (sum, extra) => sum + extra.unitPrice);
    return (unitPrice + extrasPerUnit) * quantity;
  }

  factory SaleItem.fromDB(
    DbSaleItem row, {
    List<SaleItemExtra> extras = const [],
  }) =>
      SaleItem(
        id: row.id,
        saleId: row.saleId,
        variantId: row.variantId,
        quantity: row.quantity,
        unitPrice: row.unitPrice,
        extras: extras,
      );

  DbSaleItemsCompanion toDB({bool isDirty = true}) {
    return DbSaleItemsCompanion(
      id: Value(id),
      saleId: Value(saleId),
      variantId: Value(variantId),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      isDirty: Value(isDirty),
    );
  }
}
