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
