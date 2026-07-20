import 'package:lamu/domain/models/product.dart';

/// A product paired with how many units of it were sold in some window.
///
/// Composed in the provider from two sources — the catalog and an aggregate
/// over sales — so it has no table behind it and no `fromDB` / `toDB`.
class ProductSalesSummary {
  final Product product;

  /// Units sold, summed over every sale item of every variant of [product].
  final int soldUnits;

  const ProductSalesSummary({required this.product, required this.soldUnits});
}
