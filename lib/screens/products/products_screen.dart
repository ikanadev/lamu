import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/models/product_sales_summary.dart';
import 'package:lamu/domain/providers/products/products_summary_provider.dart';
import 'package:lamu/screens/products/widgets/product_card.dart';
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
          child: summariesValue.when(
            data: (summaries) {
              if (summaries.isEmpty) {
                return const EmptySection(text: 'No hay productos.');
              }
              // Expanded rather than a fixed height: the products divide the
              // screen between them, however many there turn out to be.
              return Column(
                children: [
                  for (final summary in summaries)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.s12),
                        child: ProductCard(
                          key: ValueKey(summary.product.id),
                          summary: summary,
                          onTap: () => _showTodo(context, summary),
                        ),
                      ),
                    ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => const ErrorSection(
              text: 'No se pudieron cargar los productos.',
            ),
          ),
        ),
      ),
    );
  }

  void _showTodo(BuildContext context, ProductSalesSummary summary) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(summary.product.name),
        content: const Text('El registro de ventas aún no está disponible.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
