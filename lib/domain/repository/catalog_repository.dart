import 'package:drift/drift.dart';

import 'package:lamu/db/database.dart';
import 'package:lamu/domain/models/extra.dart';
import 'package:lamu/domain/models/flavor.dart';
import 'package:lamu/domain/models/product.dart';
import 'package:lamu/domain/models/product_size.dart';
import 'package:lamu/domain/models/product_variant.dart';

/// Reads the seeded catalog: products, the size and flavor lookups, every
/// sellable variant and the extras.
///
/// These five tables are seeded together and only ever read together — a
/// product picker needs all of them — so they share one repository instead of
/// one apiece.
class CatalogRepository {
  CatalogRepository(this._database);

  final AppDatabase _database;

  Future<List<Product>> listProducts() async {
    final rows = await (_database.select(_database.dbProducts)
          ..where((p) => p.isDeleted.equals(false) & p.isActive.equals(true))
          ..orderBy([(p) => OrderingTerm.asc(p.name)]))
        .get();

    return rows.map(Product.fromDB).toList();
  }

  Future<List<ProductSize>> listSizes() async {
    final rows = await (_database.select(_database.dbSizes)
          ..where((s) => s.isDeleted.equals(false))
          ..orderBy([(s) => OrderingTerm.asc(s.reference)]))
        .get();

    return rows.map(ProductSize.fromDB).toList();
  }

  Future<List<Flavor>> listFlavors() async {
    final rows = await (_database.select(_database.dbFlavors)
          ..where((f) => f.isDeleted.equals(false))
          ..orderBy([(f) => OrderingTerm.asc(f.name)]))
        .get();

    return rows.map(Flavor.fromDB).toList();
  }

  /// Every active variant, or only one product's when [productId] is given.
  Future<List<ProductVariant>> listVariants({String? productId}) async {
    final query = _database.select(_database.dbProductVariants)
      ..where((v) => v.isDeleted.equals(false) & v.isActive.equals(true));

    if (productId != null) {
      query.where((v) => v.productId.equals(productId));
    }

    final rows = await query.get();
    return rows.map(ProductVariant.fromDB).toList();
  }

  /// Every active extra, or only one product's when [productId] is given.
  Future<List<Extra>> listExtras({String? productId}) async {
    final query = _database.select(_database.dbExtras)
      ..where((e) => e.isDeleted.equals(false) & e.isActive.equals(true))
      ..orderBy([(e) => OrderingTerm.asc(e.name)]);

    if (productId != null) {
      query.where((e) => e.productId.equals(productId));
    }

    final rows = await query.get();
    return rows.map(Extra.fromDB).toList();
  }

  /// Updates a variant's reference price, in cents. Sales already recorded keep
  /// the price they snapshotted.
  Future<void> updateVariantPrice({
    required String id,
    required int price,
  }) async {
    await (_database.update(_database.dbProductVariants)
          ..where((v) => v.id.equals(id)))
        .write(DbProductVariantsCompanion(
      price: Value(price),
      isDirty: const Value(true),
    ));
  }

  /// Updates an extra's reference price, in cents. Same snapshot rule as
  /// variants.
  Future<void> updateExtraPrice({
    required String id,
    required int price,
  }) async {
    await (_database.update(_database.dbExtras)..where((e) => e.id.equals(id)))
        .write(DbExtrasCompanion(
      price: Value(price),
      isDirty: const Value(true),
    ));
  }
}
