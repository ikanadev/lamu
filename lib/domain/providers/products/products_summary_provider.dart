import 'package:lamu/domain/models/product_sales_summary.dart';
import 'package:lamu/domain/repository/catalog_repository_provider.dart';
import 'package:lamu/domain/repository/sale_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_summary_provider.g.dart';

/// Every active product with the units of it sold since local midnight.
///
/// The window is computed on each read, so a session left open across midnight
/// reports the new day once this provider is invalidated.
@riverpod
Future<List<ProductSalesSummary>> productsSummary(Ref ref) async {
  final now = DateTime.now();
  final from = DateTime(now.year, now.month, now.day);
  final to = from.add(const Duration(days: 1));

  final products = await ref.watch(catalogRepositoryProvider).listProducts();
  final soldUnits = await ref
      .watch(saleRepositoryProvider)
      .soldUnitsByProduct(from: from, to: to);

  return products
      .map((product) => ProductSalesSummary(
            product: product,
            soldUnits: soldUnits[product.id] ?? 0,
          ))
      .toList();
}
