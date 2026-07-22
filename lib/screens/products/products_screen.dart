import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lamu/domain/models/product.dart';

import 'package:lamu/domain/providers/products/products_summary_provider.dart';
import 'package:lamu/screens/products/widgets/earnings_header.dart';
import 'package:lamu/screens/products/widgets/product_card.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/sale_sheet.dart';
import 'package:lamu/utils/app_theme.dart';
import 'package:lamu/widgets/empty_section.dart';
import 'package:lamu/widgets/error_section.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summariesValue = ref.watch(productsSummaryProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const EarningsHeader(),
              Expanded(
                child: Padding(
                  // Breathing room above and below the cards, so they don't
                  // butt up against the header and the navigation bar.
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.s24),
                  child: summariesValue.when(
                    data: (summaries) {
                      if (summaries.isEmpty) {
                        return const EmptySection(text: 'No hay productos.');
                      }
                      // Expanded rather than a fixed height: the products divide
                      // the space between them, however many there turn out to
                      // be.
                      return Column(
                        children: [
                          for (final summary in summaries)
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: AppSpacing.s12,
                                ),
                                child: ProductCard(
                                  key: ValueKey(summary.product.id),
                                  summary: summary,
                                  onTap: () => _openSaleSheet(context, summary.product),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err, _) => const ErrorSection(
                      text: 'No se pudieron cargar los productos.',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Static-sketch entry point: opens the collapsible-block sale sheet seeded
  // with the tapped product. No sale is recorded yet.
  void _openSaleSheet(BuildContext context, Product product) {
    showSaleSheet(context: context, selectedProduct: product);
  }
}
