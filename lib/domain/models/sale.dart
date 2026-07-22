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

  /// Cents of Bs the client left on top of [total]. Zero when none.
  final int tip;

  /// Optional free-form note attached to the sale. Null when none.
  final String? notes;
  final List<SaleItem> items;

  const Sale({
    required this.id,
    required this.soldAt,
    required this.subtotal,
    required this.total,
    this.tip = 0,
    this.notes,
    this.items = const [],
  });

  /// Cents of Bs knocked off the reference price. Zero on a full-price sale.
  int get discount => subtotal - total;

  /// Cents of Bs actually taken home for this sale: what was charged plus the
  /// tip.
  int get earned => total + tip;

  factory Sale.fromDB(DbSale row, {List<SaleItem> items = const []}) => Sale(
        id: row.id,
        soldAt: row.soldAt,
        subtotal: row.subtotal,
        total: row.total,
        tip: row.tip,
        notes: row.notes,
        items: items,
      );

  DbSalesCompanion toDB({bool isDirty = true}) {
    return DbSalesCompanion(
      id: Value(id),
      soldAt: Value(soldAt),
      subtotal: Value(subtotal),
      total: Value(total),
      tip: Value(tip),
      notes: Value(notes),
      isDirty: Value(isDirty),
    );
  }
}
