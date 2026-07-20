// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_summary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Every active product with the units of it sold since local midnight.

@ProviderFor(productsSummary)
final productsSummaryProvider = ProductsSummaryProvider._();

/// Every active product with the units of it sold since local midnight.

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

String _$productsSummaryHash() => r'bf1f81816c05cab8fefcf41fed754d7ca3d43424';
