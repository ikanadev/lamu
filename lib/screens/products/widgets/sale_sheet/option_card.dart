import 'package:flutter/material.dart';

import 'package:lamu/utils/app_theme.dart';

/// A row of options under a small label. Two layouts: [fill] spreads the cards
/// evenly across the full width (for a fixed, unchanging set like products);
/// otherwise they keep a fixed width and scroll horizontally, to save vertical
/// space. The caller supplies width-agnostic [OptionCard]s.
class SaleOptionRow extends StatelessWidget {
  const SaleOptionRow({
    super.key,
    required this.label,
    required this.cards,
    this.fill = false,
  });

  final String label;
  final List<Widget> cards;
  final bool fill;

  /// Fixed card width in the scrolling layout — wide enough that most option
  /// names fit on one line.
  static const double _cardWidth = 92;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        fill ? _fillRow() : _scrollRow(),
      ],
    );
  }

  Widget _fillRow() {
    // IntrinsicHeight bounds the row's height to the tallest card, so stretch
    // can then make every card — and the trailing size cell — that same height.
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i > 0) const SizedBox(width: AppSpacing.s8),
            Expanded(child: cards[i]),
          ],
        ],
      ),
    );
  }

  Widget _scrollRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            if (i > 0) const SizedBox(width: AppSpacing.s8),
            SizedBox(width: _cardWidth, child: cards[i]),
          ],
        ],
      ),
    );
  }
}

/// One selectable option: an image above a name, in a column. The selected card
/// highlights and renders its image larger than the rest, so the active choice
/// reads at a glance. Used for products, sizes, flavours and extras alike.
class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.iconBuilder,
    this.baseIconSize = 34,
    this.selectedIconSize = 46,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  /// Builds the option's image at the given side length. The card decides the
  /// size — larger when [selected] — so the caller can render either a vector
  /// `AppIcon` or a Material `Icon` without knowing the selection state.
  final Widget Function(double size) iconBuilder;

  /// Side length of the image when unselected and when selected. Sizes pass the
  /// same value for both to opt out of the selection enlargement; they also
  /// scale each image by the size's magnitude.
  final double baseIconSize;
  final double selectedIconSize;

  /// Height reserved for the image, constant across a row so cards stay the
  /// same size however big each glyph is. Must sit above the largest glyph.
  static const double _iconSlot = 48;
  static const Duration _duration = Duration(milliseconds: 160);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Material(
      color:
          selected ? scheme.primaryContainer : scheme.surfaceContainerHighest,
      borderRadius: AppRadius.mdAll,
      child: InkWell(
        borderRadius: AppRadius.mdAll,
        onTap: onTap,
        child: AnimatedContainer(
          duration: _duration,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s8,
            vertical: AppSpacing.s12,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.mdAll,
            border: Border.all(
              color: selected ? scheme.primary : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _iconSlot,
                child: Center(
                  child:
                      iconBuilder(selected ? selectedIconSize : baseIconSize),
                ),
              ),
              const SizedBox(height: AppSpacing.s8),
              Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: selected
                      ? scheme.onPrimaryContainer
                      : scheme.onSurfaceVariant,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
