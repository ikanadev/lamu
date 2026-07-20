import 'package:drift/drift.dart';
import 'package:lamu/utils/size_references.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';

/// Placeholder icon key for every seeded row, until real icons are designed.
const _genericIcon = 'sample';

/// Seeds the fixed catalog: the three products, their sizes and flavors, every
/// sellable variant, and the extras. Called once from
/// `MigrationStrategy.onCreate`.
///
/// Prices here are the *current reference* prices. Changing one later is an
/// update on the variant row — recorded sales keep their own snapshot.
Future<void> seedCatalog(AppDatabase db) async {
  const uuid = Uuid();

  // ── Sizes ────────────────────────────────────────────────────────────────
  final small = uuid.v4();
  final large = uuid.v4();

  await db.batch((b) {
    b.insertAll(db.dbSizes, [
      DbSizesCompanion.insert(
        id: small,
        name: AppSizeReferences.small,
        reference: AppSizeReferences.byName[AppSizeReferences.small]!,
      ),
      DbSizesCompanion.insert(
        id: large,
        name: AppSizeReferences.large,
        reference: AppSizeReferences.byName[AppSizeReferences.large]!,
      ),
    ]);
  });

  // ── Flavors ──────────────────────────────────────────────────────────────
  final frutilla = uuid.v4();
  final capuccino = uuid.v4();
  final chicle = uuid.v4();
  final limon = uuid.v4();
  final tumbo = uuid.v4();
  final maracuya = uuid.v4();
  final durazno = uuid.v4();

  await db.batch((b) {
    b.insertAll(db.dbFlavors, [
      DbFlavorsCompanion.insert(id: frutilla, name: 'Frutilla', icon: _genericIcon),
      DbFlavorsCompanion.insert(id: capuccino, name: 'Capuccino', icon: _genericIcon),
      DbFlavorsCompanion.insert(id: chicle, name: 'Chicle', icon: _genericIcon),
      DbFlavorsCompanion.insert(id: limon, name: 'Limón', icon: _genericIcon),
      DbFlavorsCompanion.insert(id: tumbo, name: 'Tumbo', icon: _genericIcon),
      DbFlavorsCompanion.insert(id: maracuya, name: 'Maracuyá', icon: _genericIcon),
      DbFlavorsCompanion.insert(id: durazno, name: 'Durazno', icon: _genericIcon),
    ]);
  });

  // ── Products ─────────────────────────────────────────────────────────────
  final fresas = uuid.v4();
  final frape = uuid.v4();
  final jugo = uuid.v4();

  // Icon keys match the `AppIcons` enum names (see lib/widgets/app_icon.dart).
  await db.batch((b) {
    b.insertAll(db.dbProducts, [
      DbProductsCompanion.insert(
          id: fresas, name: 'Fresas con crema', icon: 'strawberryCream'),
      DbProductsCompanion.insert(id: frape, name: 'Frapé', icon: 'frappe'),
      DbProductsCompanion.insert(id: jugo, name: 'Jugo', icon: 'juice'),
    ]);
  });

  // ── Variants ─────────────────────────────────────────────────────────────
  DbProductVariantsCompanion variant({
    required String productId,
    required String sizeId,
    String? flavorId,
    required int price,
  }) {
    return DbProductVariantsCompanion.insert(
      id: uuid.v4(),
      productId: productId,
      sizeId: sizeId,
      flavorId: Value(flavorId),
      price: price,
    );
  }

  // Prices in cents of Bs: Bs 18 -> 1800.
  final frapePrices = {small: 1800, large: 2700};
  final jugoPrices = {small: 1200, large: 1800};

  await db.batch((b) {
    b.insertAll(db.dbProductVariants, [
      // Fresas con crema — no flavor axis.
      variant(productId: fresas, sizeId: small, price: 1800),
      variant(productId: fresas, sizeId: large, price: 3200),

      // Frapé — 2 sizes × 3 flavors.
      for (final flavorId in [frutilla, capuccino, chicle])
        for (final entry in frapePrices.entries)
          variant(
            productId: frape,
            sizeId: entry.key,
            flavorId: flavorId,
            price: entry.value,
          ),

      // Jugo — 2 sizes × 4 frutas.
      for (final flavorId in [limon, tumbo, maracuya, durazno])
        for (final entry in jugoPrices.entries)
          variant(
            productId: jugo,
            sizeId: entry.key,
            flavorId: flavorId,
            price: entry.value,
          ),
    ]);
  });

  // ── Extras ───────────────────────────────────────────────────────────────
  await db.batch((b) {
    b.insertAll(db.dbExtras, [
      DbExtrasCompanion.insert(
        id: uuid.v4(),
        productId: fresas,
        name: 'Nutella',
        price: 500,
        icon: _genericIcon,
      ),
      DbExtrasCompanion.insert(
        id: uuid.v4(),
        productId: jugo,
        name: 'Leche',
        price: 600,
        icon: _genericIcon,
      ),
    ]);
  });
}
