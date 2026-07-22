import 'package:lamu/domain/models/sale_line.dart';

/// What the UI hands to `SaleRepository.createSale` — just the choices made.
/// Prices are not part of the draft: the repository reads the current reference
/// prices and snapshots them, so the UI can never record a stale one.
class SaleItemDraft {
  final String variantId;
  final int quantity;
  final List<String> extraIds;

  const SaleItemDraft({
    required this.variantId,
    this.quantity = 1,
    this.extraIds = const [],
  });
}

/// Distinguishes "keep the current value" from "set to null" in [copyWith].
const Object _unset = Object();

/// The whole in-progress sale the sheet is editing: its lines, which one is
/// open in the accordion, and an optional override of the final charged amount.
///
/// This is the `SaleDraftNotifier`'s state — session-scoped UI state, gone when
/// the sheet closes. It reduces itself to [SaleItemDraft]s only at submit time.
class SaleDraft {
  final List<SaleLine> lines;

  /// The line currently expanded. Exactly one is open while the sheet has
  /// lines; null only for the empty initial state before seeding.
  final String? openLineId;

  /// Final charged amount in cents. Null charges the computed [subtotalCents];
  /// set it to override (e.g. a discount on a large order).
  final int? overrideTotalCents;

  const SaleDraft({
    this.lines = const [],
    this.openLineId,
    this.overrideTotalCents,
  });

  /// Sum of the lines at reference prices, in cents.
  int get subtotalCents =>
      lines.fold<int>(0, (sum, line) => sum + line.subtotalCents);

  /// What will actually be charged: the override if set, else the subtotal.
  int get totalCents => overrideTotalCents ?? subtotalCents;

  /// The sale can be recorded once there is at least one line and every line
  /// has resolved to a variant.
  bool get canSubmit =>
      lines.isNotEmpty && lines.every((line) => line.isComplete);

  SaleLine? get openLine {
    for (final line in lines) {
      if (line.lineId == openLineId) return line;
    }
    return null;
  }

  /// Reduces every line to the id-only DTO the repository records. Only call
  /// when [canSubmit]; an incomplete line has no variant and will throw.
  List<SaleItemDraft> toItemDrafts() => [
        for (final line in lines)
          SaleItemDraft(
            variantId: line.variant!.id,
            quantity: line.quantity,
            extraIds: [for (final extra in line.extras) extra.id],
          ),
      ];

  SaleDraft copyWith({
    List<SaleLine>? lines,
    Object? openLineId = _unset,
    Object? overrideTotalCents = _unset,
  }) {
    return SaleDraft(
      lines: lines ?? this.lines,
      openLineId:
          identical(openLineId, _unset) ? this.openLineId : openLineId as String?,
      overrideTotalCents: identical(overrideTotalCents, _unset)
          ? this.overrideTotalCents
          : overrideTotalCents as int?,
    );
  }
}
