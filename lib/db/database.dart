import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';

import 'models/extras.dart';
import 'models/flavors.dart';
import 'models/product_variants.dart';
import 'models/products.dart';
import 'models/sale_item_extras.dart';
import 'models/sale_items.dart';
import 'models/sales.dart';
import 'models/samples.dart';
import 'models/sizes.dart';
import 'seed.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    DbSamples,
    DbProducts,
    DbSizes,
    DbFlavors,
    DbProductVariants,
    DbExtras,
    DbSales,
    DbSaleItems,
    DbSaleItemExtras,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      // Runs on every open, so catalog items added in a later release reach
      // devices seeded by an earlier one. Both seeders are idempotent.
      beforeOpen: (details) async {
        await ensureCreatedCatalog(this);
        if (!kReleaseMode) await seedDummyData(this);
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'lamu_database');
  }
}
