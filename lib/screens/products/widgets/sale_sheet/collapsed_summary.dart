import 'package:flutter/material.dart';

import 'package:lamu/domain/models/sale_line.dart';
import 'package:lamu/utils/app_theme.dart';
import 'package:lamu/widgets/app_icon.dart';
import 'package:lamu/widgets/money_text.dart';

/// The entire collapsed face of a line: one compact row summarising the order —
/// a small product image, the product name with the choices made so far, and
/// the line price. Deliberately unlike the expanded form; it just recaps.
class CollapsedSummary extends StatelessWidget {
  const CollapsedSummary({super.key, required this.line});

  final SaleLine line;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icon = AppIcons.tryParse(line.product.icon);
    final details = [
      if (line.flavor != null) line.flavor!.name,
      if (line.size != null) line.size!.name,
      '×${line.quantity}',
    ].join(' · ');

    return Row(
      children: [
        AppIcon(icon: icon, size: 24),
        const SizedBox(width: AppSpacing.s12),
        Expanded(
          child: RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: theme.textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: line.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '   $details',
                  style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.s8),
        MoneyText(line.subtotalCents, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}
