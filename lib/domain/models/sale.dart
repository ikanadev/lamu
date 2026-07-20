import 'package:drift/drift.dart';

import 'package:lamu/db/database.dart';
import 'package:lamu/domain/models/sale_item.dart';

class Sale {
  final String id;
  final DateTime soldAt;

  /// Cents of Bs, at the prices snapshotted on the item lines.
  final int subtotal;

  /// Cents of Bs actually charged.
  final int total;
  final List<SaleItem> items;

  const Sale({
    required this.id,
    required this.soldAt,
    required this.subtotal,
    required this.total,
    this.items = const [],
  });

  /// Cents of Bs knocked off the reference price. Zero on a full-price sale.
  int get discount => subtotal - total;

  factory Sale.fromDB(DbSale row, {List<SaleItem> items = const []}) => Sale(
        id: row.id,
        soldAt: row.soldAt,
        subtotal: row.subtotal,
        total: row.total,
        items: items,
      );

  DbSalesCompanion toDB({bool isDirty = true}) {
    return DbSalesCompanion(
      id: Value(id),
      soldAt: Value(soldAt),
      subtotal: Value(subtotal),
      total: Value(total),
      isDirty: Value(isDirty),
    );
  }
}
