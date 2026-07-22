import 'package:lamu/domain/models/sale_draft.dart';
import 'package:lamu/domain/providers/products/products_summary_provider.dart';
import 'package:lamu/domain/providers/sales/today_earnings_provider.dart';
import 'package:lamu/domain/repository/sale_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sale_actions_provider.g.dart';

/// Persists sales. The draft notifier holds the editing state; this is the only
/// thing that writes it to the database.
@Riverpod(keepAlive: true)
class SaleActions extends _$SaleActions {
  @override
  FutureOr<void> build() {}

  /// Records [items] (from `SaleDraft.toItemDrafts()`), charging [total] cents
  /// when the seller overrode the amount, else full reference price. Returns
  /// the new sale id and refreshes the today's-earnings and product summaries.
  Future<String> createSale({
    required List<SaleItemDraft> items,
    int? total,
  }) async {
    final id = await ref
        .read(saleRepositoryProvider)
        .createSale(items: items, total: total);

    ref.invalidate(todayEarningsProvider);
    ref.invalidate(productsSummaryProvider);
    return id;
  }
}
