import 'package:flutter/material.dart';

import 'package:lamu/domain/models/product_sales_summary.dart';
import 'package:lamu/utils/app_theme.dart';
import 'package:lamu/widgets/app_icon.dart';

/// One product, sized to fill its share of the screen: the icon and name carry
/// recognition, the numeral reports what has been sold today.
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.summary, required this.onTap});

  final ProductSalesSummary summary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Seeded products carry a real icon key; the fallback keeps the card
    // rendering for any unrecognized key.
    final icon = AppIcons.tryParse(summary.product.icon) ?? AppIcons.sample;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.s16, AppSpacing.s32, AppSpacing.s32, AppSpacing.s32),
          child: Row(
            children: [
              AppIcon(icon: icon, size: 72),
              const SizedBox(width: AppSpacing.s16),
              Expanded(
                child: Text(
                  summary.product.name,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              const SizedBox(width: AppSpacing.s12),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${summary.soldUnits}',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Text(
                    'hoy',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
