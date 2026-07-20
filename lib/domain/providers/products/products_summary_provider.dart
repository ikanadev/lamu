import 'package:lamu/domain/models/product_sales_summary.dart';
import 'package:lamu/domain/repository/catalog_repository_provider.dart';
import 'package:lamu/domain/repository/sale_repository_provider.dart';
import 'package:lamu/utils/day_range.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_summary_provider.g.dart';

/// Every active product with the units of it sold since local midnight.
@riverpod
Future<List<ProductSalesSummary>> productsSummary(Ref ref) async {
  final today = DayRange.today();

  final products = await ref.watch(catalogRepositoryProvider).listProducts();
  final soldUnits = await ref
      .watch(saleRepositoryProvider)
      .soldUnitsByProduct(from: today.from, to: today.to);

  return products
      .map((product) => ProductSalesSummary(
            product: product,
            soldUnits: soldUnits[product.id] ?? 0,
          ))
      .toList();
}
