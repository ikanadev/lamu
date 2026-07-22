// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_options_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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
         isAutoDispose: true,
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

String _$productVariantsHash() => r'4cc747c8d05e13590237ebad6293b210b538e510';

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
        isAutoDispose: true,
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
         isAutoDispose: true,
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

String _$productSizesHash() => r'da3b42d6f42a694788999f8264aeb2b39c900c15';

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
        isAutoDispose: true,
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
         isAutoDispose: true,
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

String _$productFlavorsHash() => r'700a51203b29b53f5973bf206ce1af68780bbb2a';

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
        isAutoDispose: true,
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
         isAutoDispose: true,
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

String _$productExtrasHash() => r'cf3a930fea8eb9da3b7bde880ebac71ce0c2b6e5';

/// Extras available for [productId].

final class ProductExtrasFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Extra>>, String> {
  ProductExtrasFamily._()
    : super(
        retry: null,
        name: r'productExtrasProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Extras available for [productId].

  ProductExtrasProvider call(String productId) =>
      ProductExtrasProvider._(argument: productId, from: this);

  @override
  String toString() => r'productExtrasProvider';
}
