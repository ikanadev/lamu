import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/models/sale_line.dart';
import 'package:lamu/domain/providers/catalog/product_options_provider.dart';
import 'package:lamu/domain/providers/sales/sale_draft_provider.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/quantity_stepper.dart';
import 'package:lamu/utils/app_theme.dart';

/// The expanded face of a block: size, flavour, extras and quantity. The option
/// lists come from providers keyed by the line's product; picking size or
/// flavour re-resolves the variant in the notifier.
class BlockForm extends ConsumerWidget {
  const BlockForm({super.key, required this.line});

  final SaleLine line;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(saleDraftProvider.notifier);
    final productId = line.product.id;

    final sizes = ref.watch(productSizesProvider(productId));
    final flavors = ref.watch(productFlavorsProvider(productId));
    final extras = ref.watch(productExtrasProvider(productId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Size — single select, required to resolve a variant.
        sizes.when(
          data: (list) => SegmentedButton<String>(
            emptySelectionAllowed: true,
            segments: [
              for (final size in list)
                ButtonSegment(value: size.id, label: Text(size.name)),
            ],
            selected: line.size == null ? const {} : {line.size!.id},
            onSelectionChanged: (selection) {
              if (selection.isEmpty) return;
              final size = list.firstWhere((s) => s.id == selection.first);
              notifier.selectSize(line.lineId, size);
            },
          ),
          loading: () => const _SectionLoader(),
          error: (_, _) => const SizedBox.shrink(),
        ),
        // Flavour — omitted for products with no flavour axis (fresas).
        flavors.maybeWhen(
          data: (list) => list.isEmpty
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.s12),
                  child: Wrap(
                    spacing: AppSpacing.s8,
                    children: [
                      for (final flavor in list)
                        ChoiceChip(
                          label: Text(flavor.name),
                          selected: line.flavor?.id == flavor.id,
                          onSelected: (_) =>
                              notifier.selectFlavor(line.lineId, flavor),
                        ),
                    ],
                  ),
                ),
          orElse: () => const SizedBox.shrink(),
        ),
        // Extras — multi select, don't affect variant resolution.
        extras.maybeWhen(
          data: (list) => list.isEmpty
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.s12),
                  child: Wrap(
                    spacing: AppSpacing.s8,
                    children: [
                      for (final extra in list)
                        FilterChip(
                          label: Text(extra.name),
                          selected: line.extras.any((e) => e.id == extra.id),
                          onSelected: (_) =>
                              notifier.toggleExtra(line.lineId, extra),
                        ),
                    ],
                  ),
                ),
          orElse: () => const SizedBox.shrink(),
        ),
        const SizedBox(height: AppSpacing.s12),
        QuantityStepper(
          quantity: line.quantity,
          onDecrement: () =>
              notifier.setQuantity(line.lineId, line.quantity - 1),
          onIncrement: () =>
              notifier.setQuantity(line.lineId, line.quantity + 1),
        ),
      ],
    );
  }
}

class _SectionLoader extends StatelessWidget {
  const _SectionLoader();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.s8),
      child: LinearProgressIndicator(),
    );
  }
}
