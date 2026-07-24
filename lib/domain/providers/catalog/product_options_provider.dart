import 'package:lamu/domain/models/extra.dart';
import 'package:lamu/domain/models/flavor.dart';
import 'package:lamu/domain/models/product.dart';
import 'package:lamu/domain/models/product_size.dart';
import 'package:lamu/domain/models/product_variant.dart';
import 'package:lamu/domain/repository/catalog_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_options_provider.g.dart';

/// The full catalog of active products — the source for the sale sheet's
/// product switcher, where a line can be retargeted to any product.
@Riverpod(keepAlive: true)
Future<List<Product>> catalogProducts(Ref ref) {
  return ref.watch(catalogRepositoryProvider).listProducts();
}

/// Every sellable variant for one product. The size and flavour option lists
/// below, and the sale sheet's variant resolution, all derive from this.
@Riverpod(keepAlive: true)
Future<List<ProductVariant>> productVariants(Ref ref, String productId) {
  return ref
      .watch(catalogRepositoryProvider)
      .listVariants(productId: productId);
}

/// Sizes offered by [productId] — the distinct sizes across its variants,
/// smallest first (the global size list is already ordered by reference).
@Riverpod(keepAlive: true)
Future<List<ProductSize>> productSizes(Ref ref, String productId) async {
  final variants = await ref.watch(productVariantsProvider(productId).future);
  final sizeIds = {for (final v in variants) v.sizeId};

  final sizes = await ref.watch(catalogRepositoryProvider).listSizes();
  return [for (final size in sizes) if (sizeIds.contains(size.id)) size];
}

/// Flavours offered by [productId]. Empty for products with no flavour axis
/// (fresas con crema), whose variants carry a null flavour.
@Riverpod(keepAlive: true)
Future<List<Flavor>> productFlavors(Ref ref, String productId) async {
  final variants = await ref.watch(productVariantsProvider(productId).future);
  final flavorIds = {
    for (final v in variants)
      if (v.flavorId != null) v.flavorId,
  };
  if (flavorIds.isEmpty) return const [];

  final flavors = await ref.watch(catalogRepositoryProvider).listFlavors();
  return [for (final flavor in flavors) if (flavorIds.contains(flavor.id)) flavor];
}

/// Extras available for [productId].
@Riverpod(keepAlive: true)
Future<List<Extra>> productExtras(Ref ref, String productId) {
  return ref.watch(catalogRepositoryProvider).listExtras(productId: productId);
}
