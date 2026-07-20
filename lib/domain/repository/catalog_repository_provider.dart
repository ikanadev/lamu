import 'package:lamu/db/db_provider.dart';
import 'package:lamu/domain/repository/catalog_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'catalog_repository_provider.g.dart';

@riverpod
CatalogRepository catalogRepository(Ref ref) {
  final db = ref.watch(dbProvider);
  return CatalogRepository(db);
}
