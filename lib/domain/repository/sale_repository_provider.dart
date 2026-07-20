import 'package:lamu/db/db_provider.dart';
import 'package:lamu/domain/repository/sale_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sale_repository_provider.g.dart';

@riverpod
SaleRepository saleRepository(Ref ref) {
  final db = ref.watch(dbProvider);
  return SaleRepository(db);
}
