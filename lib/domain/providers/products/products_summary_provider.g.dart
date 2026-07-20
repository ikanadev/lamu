// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_summary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Every active product with the units of it sold since local midnight.
///
/// The window is computed on each read, so a session left open across midnight
/// reports the new day once this provider is invalidated.

@ProviderFor(productsSummary)
final productsSummaryProvider = ProductsSummaryProvider._();

/// Every active product with the units of it sold since local midnight.
///
/// The window is computed on each read, so a session left open across midnight
/// reports the new day once this provider is invalidated.

final class ProductsSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductSalesSummary>>,
          List<ProductSalesSummary>,
          FutureOr<List<ProductSalesSummary>>
        >
    with
        $FutureModifier<List<ProductSalesSummary>>,
        $FutureProvider<List<ProductSalesSummary>> {
  /// Every active product with the units of it sold since local midnight.
  ///
  /// The window is computed on each read, so a session left open across midnight
  /// reports the new day once this provider is invalidated.
  ProductsSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsSummaryHash();

  @$internal
  @override
  $FutureProviderElement<List<ProductSalesSummary>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProductSalesSummary>> create(Ref ref) {
    return productsSummary(ref);
  }
}

String _$productsSummaryHash() => r'063057f8a87e6949c913d849b95f0f2b4715a986';
