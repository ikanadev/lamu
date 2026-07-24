import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/models/sale_line.dart';
import 'package:lamu/domain/providers/sales/sale_draft_provider.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/block_form.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/collapsed_summary.dart';
import 'package:lamu/utils/app_theme.dart';

/// One floating block in the sheet. Its two faces are entirely separate: while
/// collapsed it is a single summary line; while open it is the full option
/// form. The content swaps outright between them.
class SaleBlock extends ConsumerWidget {
  const SaleBlock({super.key, required this.line, required this.isOpen});

  final SaleLine line;
  final bool isOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.s2),
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.lgAll),
      child: isOpen ? _expanded() : _collapsed(ref),
    );
  }

  /// Compact summary; tapping opens the line. The open line has no collapse
  /// affordance, so a block can never close to nothing.
  Widget _collapsed(WidgetRef ref) {
    return InkWell(
      onTap: () => ref.read(saleDraftProvider.notifier).open(line.lineId),
      borderRadius: AppRadius.lgAll,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s12,
        ),
        child: CollapsedSummary(line: line),
      ),
    );
  }

  Widget _expanded() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.s16),
      child: BlockForm(line: line),
    );
  }
}
