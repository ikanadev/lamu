import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/providers/sales/sale_draft_provider.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/override_total_dialog.dart';
import 'package:lamu/utils/app_theme.dart';
import 'package:lamu/widgets/money_text.dart';

/// Pinned top bar. The total is pressable: tapping it overrides the final
/// charged amount for the whole sale; when overridden, a reset clears it back
/// to the computed subtotal.
class TotalBar extends ConsumerWidget {
  const TotalBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final draft = ref.watch(saleDraftProvider);
    final overridden = draft.overrideTotalCents != null;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s12,
        ),
        child: Row(
          children: [
            Text('Total', style: theme.textTheme.titleMedium),
            const SizedBox(width: AppSpacing.s8),
            InkWell(
              borderRadius: AppRadius.smAll,
              onTap: () => _editTotal(context, ref, draft.totalCents),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.s4),
                child: MoneyText(
                  draft.totalCents,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
            const Spacer(),
            if (overridden)
              TextButton.icon(
                onPressed: () =>
                    ref.read(saleDraftProvider.notifier).setOverrideTotal(null),
                icon: const Icon(Icons.undo, size: 18),
                label: const Text('Restablecer'),
              )
            else
              // Tip is a later DB change; this is a placeholder entry point.
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.volunteer_activism_outlined, size: 18),
                label: const Text('Propina'),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _editTotal(
    BuildContext context,
    WidgetRef ref,
    int currentCents,
  ) async {
    final cents = await showDialog<int>(
      context: context,
      builder: (_) => OverrideTotalDialog(initialCents: currentCents),
    );
    if (cents != null) {
      ref.read(saleDraftProvider.notifier).setOverrideTotal(cents);
    }
  }
}
