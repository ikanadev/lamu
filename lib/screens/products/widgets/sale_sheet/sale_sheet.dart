import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/models/product.dart';
import 'package:lamu/domain/providers/sales/sale_draft_provider.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/actions_row.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/sale_block.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/total_bar.dart';
import 'package:lamu/utils/app_theme.dart';

/// The collapsible-block sale sheet. Opens as a transparent modal so the total
/// bar, the blocks and the actions float over the scrim rather than sitting on
/// one rounded panel.
Future<void> showSaleSheet({
  required BuildContext context,
  required Product selectedProduct,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (_) => SaleSheet(selectedProduct: selectedProduct),
  );
}

class SaleSheet extends ConsumerStatefulWidget {
  const SaleSheet({super.key, required this.selectedProduct});

  /// The product the user tapped, seeding the first block. More lines can be
  /// added from within the sheet.
  final Product selectedProduct;

  @override
  ConsumerState<SaleSheet> createState() => _SaleSheetState();
}

class _SaleSheetState extends ConsumerState<SaleSheet> {
  @override
  void initState() {
    super.initState();
    // Seed the draft with the tapped product once, after the first frame so we
    // don't mutate the notifier mid-build. The draft auto-disposes on close, so
    // each open starts clean.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(saleDraftProvider.notifier).seed(widget.selectedProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(saleDraftProvider);

    return Padding(
      // Lift above the keyboard (the override dialog) and give the floating
      // blocks side margins.
      padding: EdgeInsets.only(
        left: AppSpacing.s16,
        right: AppSpacing.s16,
        top: AppSpacing.s16,
        bottom: AppSpacing.s16 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TotalBar(),
          const SizedBox(height: AppSpacing.s8),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: draft.lines.length,
              itemBuilder: (_, i) {
                final line = draft.lines[i];
                return SaleBlock(
                  key: ValueKey(line.lineId),
                  line: line,
                  isOpen: line.lineId == draft.openLineId,
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.s8),
          const ActionsRow(),
        ],
      ),
    );
  }
}
