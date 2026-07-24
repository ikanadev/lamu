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
    // Present on the root navigator so the sheet covers the whole screen,
    // including the bottom navigation bar, rather than the tab's branch area.
    useRootNavigator: true,
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
      // Lift the whole sheet above the keyboard (the override dialog).
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // The total bar and blocks float with side margins; the actions bar
          // below spans the full width and sits flush to the bottom.
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.s16,
              AppSpacing.s16,
              AppSpacing.s16,
              0,
            ),
            child: const TotalBar(),
          ),
          const SizedBox(height: AppSpacing.s8),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
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
          ),
          const SizedBox(height: AppSpacing.s8),
          // Full-width bar pinned to the bottom of the screen: same card as the
          // total bar, but rounded only at the top since its bottom edge meets
          // the screen edge.
          Card(
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(AppSpacing.s16),
              child: ActionsRow(),
            ),
          ),
        ],
      ),
    );
  }
}
