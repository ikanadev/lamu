// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_options_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The full catalog of active products — the source for the sale sheet's
/// product switcher, where a line can be retargeted to any product.

@ProviderFor(catalogProducts)
final catalogProductsProvider = CatalogProductsProvider._();

/// The full catalog of active products — the source for the sale sheet's
/// product switcher, where a line can be retargeted to any product.

final class CatalogProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          FutureOr<List<Product>>
        >
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  /// The full catalog of active products — the source for the sale sheet's
  /// product switcher, where a line can be retargeted to any product.
  CatalogProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogProductsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogProductsHash();

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    return catalogProducts(ref);
  }
}

String _$catalogProductsHash() => r'2d52a9a9cb5ce1e47db3ccf423396f0a84bd13ad';

/// Every sellable variant for one product. The size and flavour option lists
/// below, and the sale sheet's variant resolution, all derive from this.

@ProviderFor(productVariants)
final productVariantsProvider = ProductVariantsFamily._();

/// Every sellable variant for one product. The size and flavour option lists
/// below, and the sale sheet's variant resolution, all derive from this.

final class ProductVariantsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductVariant>>,
          List<ProductVariant>,
          FutureOr<List<ProductVariant>>
        >
    with
        $FutureModifier<List<ProductVariant>>,
        $FutureProvider<List<ProductVariant>> {
  /// Every sellable variant for one product. The size and flavour option lists
  /// below, and the sale sheet's variant resolution, all derive from this.
  ProductVariantsProvider._({
    required ProductVariantsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productVariantsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productVariantsHash();

  @override
  String toString() {
    return r'productVariantsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ProductVariant>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProductVariant>> create(Ref ref) {
    final argument = this.argument as String;
    return productVariants(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductVariantsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productVariantsHash() => r'e90a74d346f44ac6cd5ea0884151db92360cd710';

/// Every sellable variant for one product. The size and flavour option lists
/// below, and the sale sheet's variant resolution, all derive from this.

final class ProductVariantsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ProductVariant>>, String> {
  ProductVariantsFamily._()
    : super(
        retry: null,
        name: r'productVariantsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Every sellable variant for one product. The size and flavour option lists
  /// below, and the sale sheet's variant resolution, all derive from this.

  ProductVariantsProvider call(String productId) =>
      ProductVariantsProvider._(argument: productId, from: this);

  @override
  String toString() => r'productVariantsProvider';
}

/// Sizes offered by [productId] — the distinct sizes across its variants,
/// smallest first (the global size list is already ordered by reference).

@ProviderFor(productSizes)
final productSizesProvider = ProductSizesFamily._();

/// Sizes offered by [productId] — the distinct sizes across its variants,
/// smallest first (the global size list is already ordered by reference).

final class ProductSizesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductSize>>,
          List<ProductSize>,
          FutureOr<List<ProductSize>>
        >
    with
        $FutureModifier<List<ProductSize>>,
        $FutureProvider<List<ProductSize>> {
  /// Sizes offered by [productId] — the distinct sizes across its variants,
  /// smallest first (the global size list is already ordered by reference).
  ProductSizesProvider._({
    required ProductSizesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productSizesProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productSizesHash();

  @override
  String toString() {
    return r'productSizesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ProductSize>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProductSize>> create(Ref ref) {
    final argument = this.argument as String;
    return productSizes(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductSizesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productSizesHash() => r'a215277d52d4d46268c20bb7ae75a81b7a647bba';

/// Sizes offered by [productId] — the distinct sizes across its variants,
/// smallest first (the global size list is already ordered by reference).

final class ProductSizesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ProductSize>>, String> {
  ProductSizesFamily._()
    : super(
        retry: null,
        name: r'productSizesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Sizes offered by [productId] — the distinct sizes across its variants,
  /// smallest first (the global size list is already ordered by reference).

  ProductSizesProvider call(String productId) =>
      ProductSizesProvider._(argument: productId, from: this);

  @override
  String toString() => r'productSizesProvider';
}

/// Flavours offered by [productId]. Empty for products with no flavour axis
/// (fresas con crema), whose variants carry a null flavour.

@ProviderFor(productFlavors)
final productFlavorsProvider = ProductFlavorsFamily._();

/// Flavours offered by [productId]. Empty for products with no flavour axis
/// (fresas con crema), whose variants carry a null flavour.

final class ProductFlavorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Flavor>>,
          List<Flavor>,
          FutureOr<List<Flavor>>
        >
    with $FutureModifier<List<Flavor>>, $FutureProvider<List<Flavor>> {
  /// Flavours offered by [productId]. Empty for products with no flavour axis
  /// (fresas con crema), whose variants carry a null flavour.
  ProductFlavorsProvider._({
    required ProductFlavorsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productFlavorsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productFlavorsHash();

  @override
  String toString() {
    return r'productFlavorsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Flavor>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Flavor>> create(Ref ref) {
    final argument = this.argument as String;
    return productFlavors(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductFlavorsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productFlavorsHash() => r'70ccb83c47b700ae02f55257c78372bb0c9d3b62';

/// Flavours offered by [productId]. Empty for products with no flavour axis
/// (fresas con crema), whose variants carry a null flavour.

final class ProductFlavorsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Flavor>>, String> {
  ProductFlavorsFamily._()
    : super(
        retry: null,
        name: r'productFlavorsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Flavours offered by [productId]. Empty for products with no flavour axis
  /// (fresas con crema), whose variants carry a null flavour.

  ProductFlavorsProvider call(String productId) =>
      ProductFlavorsProvider._(argument: productId, from: this);

  @override
  String toString() => r'productFlavorsProvider';
}

/// Extras available for [productId].

@ProviderFor(productExtras)
final productExtrasProvider = ProductExtrasFamily._();

/// Extras available for [productId].

final class ProductExtrasProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Extra>>,
          List<Extra>,
          FutureOr<List<Extra>>
        >
    with $FutureModifier<List<Extra>>, $FutureProvider<List<Extra>> {
  /// Extras available for [productId].
  ProductExtrasProvider._({
    required ProductExtrasFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productExtrasProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productExtrasHash();

  @override
  String toString() {
    return r'productExtrasProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Extra>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Extra>> create(Ref ref) {
    final argument = this.argument as String;
    return productExtras(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductExtrasProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productExtrasHash() => r'8dcc887594bcb45a8ada368131f6e640fe77af6c';

/// Extras available for [productId].

final class ProductExtrasFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Extra>>, String> {
  ProductExtrasFamily._()
    : super(
        retry: null,
        name: r'productExtrasProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Extras available for [productId].

  ProductExtrasProvider call(String productId) =>
      ProductExtrasProvider._(argument: productId, from: this);

  @override
  String toString() => r'productExtrasProvider';
}
