import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/models/sale_draft.dart';
import 'package:lamu/domain/providers/sales/sale_actions_provider.dart';
import 'package:lamu/domain/providers/sales/sale_draft_provider.dart';
import 'package:lamu/utils/app_theme.dart';

/// Footer that floats below the blocks: add another line, or record the sale.
class ActionsRow extends ConsumerWidget {
  const ActionsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(saleDraftProvider);

    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            // Seed the new line with the open line's product; the user retunes
            // its size/flavour from there.
            onPressed: draft.lines.isEmpty
                ? null
                : () => ref.read(saleDraftProvider.notifier).addLine(
                      (draft.openLine ?? draft.lines.first).product,
                    ),
            icon: const Icon(Icons.add),
            label: const Text('Agregar variante'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.s12),
        Expanded(
          child: FilledButton.icon(
            onPressed: draft.canSubmit ? () => _submit(context, ref, draft) : null,
            icon: const Icon(Icons.point_of_sale),
            label: const Text('Registrar venta'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _submit(
    BuildContext context,
    WidgetRef ref,
    SaleDraft draft,
  ) async {
    // Capture context-bound objects before the async gap.
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    await ref.read(saleActionsProvider.notifier).createSale(
          items: draft.toItemDrafts(),
          total: draft.overrideTotalCents,
        );

    navigator.pop();
    messenger.showSnackBar(
      const SnackBar(content: Text('Venta registrada')),
    );
  }
}
