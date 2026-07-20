import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'package:lamu/db/database.dart';
import 'package:lamu/domain/models/sale.dart';
import 'package:lamu/domain/models/sale_draft.dart';
import 'package:lamu/domain/models/sale_item.dart';
import 'package:lamu/domain/models/sale_item_extra.dart';

class SaleRepository {
  SaleRepository(this._database);

  final AppDatabase _database;
  final Uuid _uuid = const Uuid();

  /// Records a sale, snapshotting the current price of every variant and extra
  /// involved. Runs in one transaction so a sale is never half-written.
  ///
  /// [total] is what the seller actually charged, in cents — pass it when they
  /// discounted the order. Left null, the sale is charged at full reference
  /// price.
  Future<String> createSale({
    required List<SaleItemDraft> items,
    DateTime? soldAt,
    int? total,
  }) async {
    if (items.isEmpty) {
      throw ArgumentError('A sale needs at least one item.');
    }
    if (total != null && total < 0) {
      throw ArgumentError.value(total, 'total', 'Cannot be negative.');
    }

    return _database.transaction(() async {
      final saleId = _uuid.v4();
      var subtotal = 0;

      // Inserted first so the item rows have a parent to reference; the
      // amounts are filled in once the lines below are priced.
      await _database.into(_database.dbSales).insert(
            DbSalesCompanion.insert(
              id: saleId,
              soldAt: soldAt ?? DateTime.now(),
              subtotal: 0,
              total: 0,
              isDirty: const Value(true),
            ),
          );

      for (final draft in items) {
        final variant = await (_database.select(_database.dbProductVariants)
              ..where((v) => v.id.equals(draft.variantId)))
            .getSingle();

        final itemId = _uuid.v4();
        await _database.into(_database.dbSaleItems).insert(
              DbSaleItemsCompanion.insert(
                id: itemId,
                saleId: saleId,
                variantId: variant.id,
                quantity: Value(draft.quantity),
                unitPrice: variant.price,
                isDirty: const Value(true),
              ),
            );

        var extrasPerUnit = 0;
        for (final extraId in draft.extraIds) {
          final extra = await (_database.select(_database.dbExtras)
                ..where((e) => e.id.equals(extraId)))
              .getSingle();

          extrasPerUnit += extra.price;
          await _database.into(_database.dbSaleItemExtras).insert(
                DbSaleItemExtrasCompanion.insert(
                  id: _uuid.v4(),
                  saleItemId: itemId,
                  extraId: extra.id,
                  unitPrice: extra.price,
                  isDirty: const Value(true),
                ),
              );
        }

        subtotal += (variant.price + extrasPerUnit) * draft.quantity;
      }

      await (_database.update(_database.dbSales)
            ..where((s) => s.id.equals(saleId)))
          .write(DbSalesCompanion(
        subtotal: Value(subtotal),
        total: Value(total ?? subtotal),
      ));

      return saleId;
    });
  }

  /// Sales within [from] (inclusive) and [to] (exclusive), newest first, with
  /// their items and extras attached.
  Future<List<Sale>> listSales({
    required DateTime from,
    required DateTime to,
  }) async {
    final saleRows = await (_database.select(_database.dbSales)
          ..where((s) =>
              s.isDeleted.equals(false) &
              s.soldAt.isBiggerOrEqualValue(from) &
              s.soldAt.isSmallerThanValue(to))
          ..orderBy([(s) => OrderingTerm.desc(s.soldAt)]))
        .get();

    if (saleRows.isEmpty) return const [];

    final saleIds = saleRows.map((s) => s.id).toList();

    final itemRows = await (_database.select(_database.dbSaleItems)
          ..where((i) => i.isDeleted.equals(false) & i.saleId.isIn(saleIds)))
        .get();

    final extraRows = await (_database.select(_database.dbSaleItemExtras)
          ..where((e) =>
              e.isDeleted.equals(false) &
              e.saleItemId.isIn(itemRows.map((i) => i.id).toList())))
        .get();

    final extrasByItem = <String, List<SaleItemExtra>>{};
    for (final row in extraRows) {
      extrasByItem
          .putIfAbsent(row.saleItemId, () => [])
          .add(SaleItemExtra.fromDB(row));
    }

    final itemsBySale = <String, List<SaleItem>>{};
    for (final row in itemRows) {
      itemsBySale.putIfAbsent(row.saleId, () => []).add(
            SaleItem.fromDB(row, extras: extrasByItem[row.id] ?? const []),
          );
    }

    return saleRows
        .map((row) => Sale.fromDB(row, items: itemsBySale[row.id] ?? const []))
        .toList();
  }

  /// Units sold per product within [from] (inclusive) and [to] (exclusive),
  /// keyed by product id. Products that sold nothing are absent from the map.
  ///
  /// Grouped in SQL over the item lines, joined up to their variant to reach
  /// the product; the window is applied to the parent sale's `soldAt`.
  Future<Map<String, int>> soldUnitsByProduct({
    required DateTime from,
    required DateTime to,
  }) async {
    final items = _database.dbSaleItems;
    final sales = _database.dbSales;
    final variants = _database.dbProductVariants;

    final soldUnits = items.quantity.sum();

    final query = _database.selectOnly(items).join([
      innerJoin(sales, sales.id.equalsExp(items.saleId)),
      innerJoin(variants, variants.id.equalsExp(items.variantId)),
    ])
      ..where(items.isDeleted.equals(false) &
          sales.isDeleted.equals(false) &
          sales.soldAt.isBiggerOrEqualValue(from) &
          sales.soldAt.isSmallerThanValue(to))
      ..addColumns([variants.productId, soldUnits])
      ..groupBy([variants.productId]);

    final rows = await query.get();

    return {
      for (final row in rows)
        row.read(variants.productId)!: row.read(soldUnits) ?? 0,
    };
  }

  Future<void> deleteSale({required String id}) async {
    await (_database.update(_database.dbSales)..where((s) => s.id.equals(id)))
        .write(const DbSalesCompanion(
      isDeleted: Value(true),
      isDirty: Value(true),
    ));
  }
}
