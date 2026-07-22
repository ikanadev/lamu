import 'package:lamu/domain/models/extra.dart';
import 'package:lamu/domain/models/flavor.dart';
import 'package:lamu/domain/models/product.dart';
import 'package:lamu/domain/models/product_size.dart';
import 'package:lamu/domain/models/product_variant.dart';
import 'package:lamu/domain/models/sale_draft.dart';
import 'package:lamu/domain/models/sale_line.dart';
import 'package:lamu/domain/providers/catalog/product_options_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'sale_draft_provider.g.dart';

/// Session state for the sale sheet: the list of lines, which one is open, and
/// the final-amount override. Auto-disposes when the sheet closes, so each sale
/// starts from a clean draft.
///
/// Seed it once on open with [seed]. Selections that change the resolved
/// variant ([selectSize], [selectFlavor], [selectProduct]) recompute it against
/// the product's variants; extras and quantity don't affect resolution.
@riverpod
class SaleDraftNotifier extends _$SaleDraftNotifier {
  static const _uuid = Uuid();

  @override
  SaleDraft build() => const SaleDraft();

  /// Replaces the draft with a single line for [product], opened. Call once
  /// when the sheet opens.
  void seed(Product product) {
    final line = _newLine(product);
    state = SaleDraft(lines: [line], openLineId: line.lineId);
  }

  /// Appends a line for [product] and opens it.
  void addLine(Product product) {
    final line = _newLine(product);
    state = state.copyWith(
      lines: [...state.lines, line],
      openLineId: line.lineId,
    );
  }

  /// Removes a line, keeping at least one. If the open line goes, the last
  /// remaining line takes its place.
  void removeLine(String lineId) {
    if (state.lines.length <= 1) return;

    final remaining = [
      for (final line in state.lines)
        if (line.lineId != lineId) line,
    ];
    final openLineId =
        state.openLineId == lineId ? remaining.last.lineId : state.openLineId;

    state = state.copyWith(lines: remaining, openLineId: openLineId);
  }

  /// Expands [lineId]. The header of the already-open line calls nothing, so a
  /// block can never collapse to none.
  void open(String lineId) => state = state.copyWith(openLineId: lineId);

  void setQuantity(String lineId, int quantity) {
    _updateLine(lineId, (line) => line.copyWith(quantity: quantity < 1 ? 1 : quantity));
  }

  void toggleExtra(String lineId, Extra extra) {
    _updateLine(lineId, (line) {
      final selected = line.extras.any((e) => e.id == extra.id);
      final extras = selected
          ? [for (final e in line.extras) if (e.id != extra.id) e]
          : [...line.extras, extra];
      return line.copyWith(extras: extras);
    });
  }

  Future<void> selectSize(String lineId, ProductSize size) =>
      _resolveAfter(lineId, (line) => line.copyWith(size: size));

  Future<void> selectFlavor(String lineId, Flavor flavor) =>
      _resolveAfter(lineId, (line) => line.copyWith(flavor: flavor));

  /// Swaps the product on a line, resetting size, flavour and extras — they
  /// belonged to the previous product. The variant clears until a size is
  /// picked again; the sheet's option lists follow `product.id`.
  void selectProduct(String lineId, Product product) {
    _updateLine(lineId, (line) => _newLine(product, lineId: line.lineId));
  }

  void setOverrideTotal(int? cents) =>
      state = state.copyWith(overrideTotalCents: cents);

  SaleLine _newLine(Product product, {String? lineId}) =>
      SaleLine(lineId: lineId ?? _uuid.v4(), product: product);

  /// Applies [change], then re-resolves the variant from the product's variant
  /// list and writes both together.
  Future<void> _resolveAfter(
    String lineId,
    SaleLine Function(SaleLine) change,
  ) async {
    final current = _lineById(lineId);
    if (current == null) return;

    final changed = change(current);
    final variant = await _resolveVariant(changed);
    _updateLine(lineId, (_) => changed.copyWith(variant: variant));
  }

  Future<ProductVariant?> _resolveVariant(SaleLine line) async {
    final size = line.size;
    if (size == null) return null;

    final variants =
        await ref.read(productVariantsProvider(line.product.id).future);
    for (final variant in variants) {
      if (variant.sizeId == size.id && variant.flavorId == line.flavor?.id) {
        return variant;
      }
    }
    return null;
  }

  SaleLine? _lineById(String lineId) {
    for (final line in state.lines) {
      if (line.lineId == lineId) return line;
    }
    return null;
  }

  void _updateLine(String lineId, SaleLine Function(SaleLine) change) {
    state = state.copyWith(lines: [
      for (final line in state.lines)
        if (line.lineId == lineId) change(line) else line,
    ]);
  }
}
