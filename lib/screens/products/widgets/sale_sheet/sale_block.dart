import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/models/sale_line.dart';
import 'package:lamu/domain/providers/sales/sale_draft_provider.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/block_form.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/collapsed_summary.dart';
import 'package:lamu/utils/app_theme.dart';
import 'package:lamu/widgets/app_icon.dart';
import 'package:lamu/widgets/money_text.dart';

/// One floating collapsible block. The header is always visible; the body
/// cross-fades between a one-line summary (collapsed) and the full form.
class SaleBlock extends ConsumerWidget {
  const SaleBlock({super.key, required this.line, required this.isOpen});

  final SaleLine line;
  final bool isOpen;

  static const Duration _duration = Duration(milliseconds: 220);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final icon = AppIcons.tryParse(line.product.icon);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.s8),
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.lgAll),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header. Tapping while open is a no-op so a block can never close to
          // nothing.
          InkWell(
            onTap: isOpen
                ? null
                : () => ref.read(saleDraftProvider.notifier).open(line.lineId),
            borderRadius: AppRadius.lgAll,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.s16),
              child: Row(
                children: [
                  AppIcon(icon: icon, size: 40),
                  const SizedBox(width: AppSpacing.s12),
                  Expanded(
                    child: Text(
                      line.product.name,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  // Display-only: the whole-sale amount is edited from the total
                  // bar, not per line.
                  MoneyText(line.subtotalCents, style: theme.textTheme.titleMedium),
                  const SizedBox(width: AppSpacing.s8),
                  AnimatedRotation(
                    turns: isOpen ? 0.5 : 0,
                    duration: _duration,
                    child: const Icon(Icons.expand_more),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.s16,
              0,
              AppSpacing.s16,
              AppSpacing.s16,
            ),
            child: AnimatedCrossFade(
              duration: _duration,
              sizeCurve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              crossFadeState:
                  isOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: CollapsedSummary(line: line),
              secondChild: BlockForm(line: line),
            ),
          ),
        ],
      ),
    );
  }
}
