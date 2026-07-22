import 'package:lamu/domain/models/extra.dart';
import 'package:lamu/domain/models/flavor.dart';
import 'package:lamu/domain/models/product.dart';
import 'package:lamu/domain/models/product_size.dart';
import 'package:lamu/domain/models/product_variant.dart';

/// Distinguishes "keep the current value" from "set to null" in [copyWith].
const Object _unset = Object();

/// One editable line in the in-progress sale sheet.
///
/// Working UI state, not a persistence model: it carries whole catalog objects
/// and nullable selections while the user is still choosing. It knows nothing
/// about the database — reducing a finished draft to the id-only DTO the
/// repository records is `SaleDraft`'s job, not the line's.
class SaleLine {
  /// Client-side id, stable across edits so the accordion can track which line
  /// is open even as lines are added and removed. Not a database key.
  final String lineId;

  final Product product;
  final ProductSize? size;

  /// Null while unpicked, and permanently null for products with no flavour
  /// axis (fresas con crema).
  final Flavor? flavor;

  final List<Extra> extras;
  final int quantity;

  /// The variant resolved from (product, size, flavor), or null while the
  /// selection is incomplete. Derived — the notifier sets it; never edit it
  /// directly.
  final ProductVariant? variant;

  const SaleLine({
    required this.lineId,
    required this.product,
    this.size,
    this.flavor,
    this.extras = const [],
    this.quantity = 1,
    this.variant,
  });

  /// A resolved variant is exactly what makes a line sellable: a product with a
  /// flavour axis has no null-flavour variant to resolve, so this is correct
  /// for both flavoured and flavourless products without special-casing.
  bool get isComplete => variant != null;

  /// Line price in cents: the variant plus its extras, times quantity. Zero
  /// until a variant resolves.
  int get subtotalCents {
    final base = variant?.price ?? 0;
    final extrasPerUnit = extras.fold<int>(0, (sum, e) => sum + e.price);
    return (base + extrasPerUnit) * quantity;
  }

  SaleLine copyWith({
    Object? size = _unset,
    Object? flavor = _unset,
    List<Extra>? extras,
    int? quantity,
    Object? variant = _unset,
  }) {
    return SaleLine(
      lineId: lineId,
      product: product,
      size: identical(size, _unset) ? this.size : size as ProductSize?,
      flavor: identical(flavor, _unset) ? this.flavor : flavor as Flavor?,
      extras: extras ?? this.extras,
      quantity: quantity ?? this.quantity,
      variant: identical(variant, _unset) ? this.variant : variant as ProductVariant?,
    );
  }
}
