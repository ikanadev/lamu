import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lamu/domain/models/product_size.dart';
import 'package:lamu/domain/models/sale_line.dart';
import 'package:lamu/domain/providers/catalog/product_options_provider.dart';
import 'package:lamu/domain/providers/sales/sale_draft_provider.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/option_card.dart';
import 'package:lamu/screens/products/widgets/sale_sheet/quantity_stepper.dart';
import 'package:lamu/utils/app_theme.dart';
import 'package:lamu/widgets/app_icon.dart';
import 'package:lamu/widgets/money_text.dart';

/// Fixed width of a size/extra card in the scrolling groups — matches the width
/// `SaleOptionRow` uses for its scrolling cards.
const double _kCardWidth = 92;

/// The expanded face of a block: quantity and subtotal up top, then the product
/// and flavour card rows, and a combined size + extras row. Option lists come
/// from providers keyed by the line's product; picking size or flavour
/// re-resolves the variant in the notifier.
class BlockForm extends ConsumerWidget {
  const BlockForm({super.key, required this.line});

  final SaleLine line;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.read(saleDraftProvider.notifier);
    final productId = line.product.id;

    final products = ref.watch(catalogProductsProvider);
    final flavors = ref.watch(productFlavorsProvider(productId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Subtotal on the left, quantity on the right.
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Subtotal',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.s4),
                MoneyText(
                  line.subtotalCents,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),
            QuantityStepper(
              quantity: line.quantity,
              onDecrement: () =>
                  notifier.setQuantity(line.lineId, line.quantity - 1),
              onIncrement: () =>
                  notifier.setQuantity(line.lineId, line.quantity + 1),
            ),
          ],
        ),
        // Producto — always exactly one selected, spread across the full width
        // since the set is fixed. Switching resets size/flavour/extras; tapping
        // the current product is a no-op so those choices are never wiped.
        _section(
          products.maybeWhen(
            data: (productList) => SaleOptionRow(
              label: 'Producto',
              fill: true,
              cards: [
                for (final product in productList)
                  OptionCard(
                    label: product.name,
                    selected: product.id == line.product.id,
                    onTap: () {
                      if (product.id != line.product.id) {
                        notifier.selectProduct(line.lineId, product);
                      }
                    },
                    iconBuilder: (size) => AppIcon(
                      icon: AppIcons.tryParse(product.icon),
                      size: size,
                    ),
                  ),
              ],
            ),
            orElse: () => const _SectionLoader(),
          ),
        ),
        // Sabor — omitted for products with no flavour axis (fresas).
        flavors.maybeWhen(
          data: (list) => list.isEmpty
              ? const SizedBox.shrink()
              : _section(
                  SaleOptionRow(
                    label: 'Sabor',
                    cards: [
                      for (final flavor in list)
                        OptionCard(
                          label: flavor.name,
                          selected: line.flavor?.id == flavor.id,
                          onTap: () =>
                              notifier.selectFlavor(line.lineId, flavor),
                          iconBuilder: (size) => AppIcon(
                            icon: AppIcons.tryParse(flavor.icon),
                            size: size,
                          ),
                        ),
                    ],
                  ),
                ),
          orElse: () => const SizedBox.shrink(),
        ),
        // Tamaño + Extras share one row — enough room since neither has many
        // options. Sizes come first, styled like extras but without the
        // grow-on-select. A single-size product drops the sizes; a product with
        // no extras (frappé) shows only the sizes.
        _SizeExtrasRow(line: line),
      ],
    );
  }

  /// A visible section, with the standard gap above it. Hidden sections return
  /// a bare `SizedBox.shrink` instead, so they take no vertical space.
  Widget _section(Widget child) => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.s16),
        child: child,
      );
}

/// The size and extras row: two labeled groups — sizes (single-select, they
/// resolve the variant) and extras (multi-select) — set side by side, split by
/// a vertical divider, their labels on the same line. Both use the same card;
/// only the sizes' image scales with magnitude and never grows on selection.
/// A single-size product drops the sizes group; a product with no extras drops
/// the extras group (and, with it, the divider).
class _SizeExtrasRow extends ConsumerWidget {
  const _SizeExtrasRow({required this.line});

  final SaleLine line;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifier = ref.read(saleDraftProvider.notifier);
    final productId = line.product.id;

    final sizeList =
        ref.watch(productSizesProvider(productId)).asData?.value ?? const [];
    final extraList =
        ref.watch(productExtrasProvider(productId)).asData?.value ?? const [];

    // A lone size is picked under the hood and its group dropped, so the user
    // never chooses from a list of one.
    if (sizeList.length == 1) _autoSelectSole(notifier, sizeList.first);
    final showSizes = sizeList.length > 1;
    final hasExtras = extraList.isNotEmpty;
    if (!showSizes && !hasExtras) return const SizedBox.shrink();

    final sizeCards = [
      for (final size in sizeList)
        OptionCard(
          label: size.name,
          selected: line.size?.id == size.id,
          onTap: () => notifier.selectSize(line.lineId, size),
          baseIconSize: _sizeIconBase(size, sizeList),
          selectedIconSize: _sizeIconBase(size, sizeList),
          iconBuilder: (iconSize) => Icon(
            Icons.local_drink,
            size: iconSize,
            color: line.size?.id == size.id
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
    ];
    final extraCards = [
      for (final extra in extraList)
        OptionCard(
          label: extra.name,
          selected: line.extras.any((e) => e.id == extra.id),
          onTap: () => notifier.toggleExtra(line.lineId, extra),
          iconBuilder: (size) => AppIcon(
            icon: AppIcons.tryParse(extra.icon),
            size: size,
          ),
        ),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.s16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // IntrinsicHeight + stretch gives the divider a height to fill and keeps
        // both groups the same height, so their labels sit on one line.
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showSizes) _group(theme, 'Tamaño', sizeCards),
              if (showSizes && hasExtras)
                const VerticalDivider(width: AppSpacing.s16),
              if (hasExtras) _group(theme, 'Extras', extraCards),
            ],
          ),
        ),
      ),
    );
  }

  Widget _group(ThemeData theme, String label, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.s8),
        Row(
          children: [
            for (var i = 0; i < cards.length; i++) ...[
              if (i > 0) const SizedBox(width: AppSpacing.s8),
              SizedBox(width: _kCardWidth, child: cards[i]),
            ],
          ],
        ),
      ],
    );
  }

  /// Selects the only size a product offers. Scheduled after the frame to avoid
  /// mutating the notifier mid-build; guarded so it fires only until it sticks.
  void _autoSelectSole(SaleDraftNotifier notifier, ProductSize only) {
    if (line.size?.id == only.id) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.selectSize(line.lineId, only);
    });
  }

  /// Image side length for [size]'s card, lerped across the product's size
  /// range so the smallest reads small and the largest big.
  double _sizeIconBase(ProductSize size, List<ProductSize> all) {
    var min = all.first.reference;
    var max = all.first.reference;
    for (final s in all) {
      if (s.reference < min) min = s.reference;
      if (s.reference > max) max = s.reference;
    }
    if (max == min) return 30;
    final t = (size.reference - min) / (max - min);
    return 22 + t * 18; // 22..40
  }
}

class _SectionLoader extends StatelessWidget {
  const _SectionLoader();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: AppSpacing.s16),
      child: LinearProgressIndicator(),
    );
  }
}
