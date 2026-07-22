import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';

/// Namespace for the deterministic seed ids below. Any fixed UUID works — it
/// only has to stay constant so a given seed key always maps to the same id.
const _seedNamespace = '6f9619ff-8b86-d011-b42d-00cf4fc964ff';

/// Deterministic id for a seed row. Same [key] -> same UUID on every run and
/// across releases, so `ensureCreatedCatalog` can insert missing rows without
/// ever duplicating existing ones.
String _seedId(String key) => const Uuid().v5(_seedNamespace, key);

// ── Catalog definition ───────────────────────────────────────────────────────
// The fixed set of items the app must always have. Add to these lists across
// releases; `ensureCreatedCatalog` inserts whatever is missing. `key` is a
// stable identity (never change it once shipped); `icon` matches the `AppIcons`
// enum name (see lib/widgets/app_icon.dart).

class _Size {
  const _Size(this.key, this.name, this.reference);
  final String key;
  final String name;

  /// Relative magnitude, smallest to largest. Spaced with gaps so a new size
  /// (e.g. a Mediano at 7) can slot between existing ones without renumbering.
  final int reference;
}

class _Product {
  const _Product(this.key, this.name, this.icon);
  final String key;
  final String name;
  final String icon;
}

class _Flavor {
  const _Flavor(this.key, this.name, this.icon);
  final String key;
  final String name;
  final String icon;
}

class _Extra {
  const _Extra(this.key, this.name, this.icon, this.productKey, this.price);
  final String key;
  final String name;
  final String icon;
  final String productKey;

  /// Cents of Bs.
  final int price;
}

const _sizes = [
  _Size('size:small', 'Pequeño', 5),
  _Size('size:large', 'Grande', 10),
];

const _products = [
  _Product('product:fresasConCrema', 'Fresas con crema', 'fresasConCrema'),
  _Product('product:frappe', 'Frappé', 'frappe'),
  _Product('product:jugo', 'Jugos', 'jugo'),
];

const _flavors = [
  _Flavor('flavor:oreo', 'Óreo', 'oreo'),
  _Flavor('flavor:fresa', 'Frutilla', 'fresa'),
  _Flavor('flavor:capuccino', 'Capuccino', 'capuccino'),
  _Flavor('flavor:chicle', 'Chicle', 'chicle'),
  _Flavor('flavor:arandano', 'Arándano', 'arandano'),
  _Flavor('flavor:durazno', 'Durazno', 'durazno'),
  _Flavor('flavor:limon', 'Limón', 'limon'),
  _Flavor('flavor:tumbo', 'Tumbo', 'tumbo'),
  _Flavor('flavor:maracuya', 'Maracuyá', 'maracuya'),
];

const _extras = [
  _Extra('extra:nutella', 'Nutella', 'nutella', 'product:fresasConCrema', 500),
  _Extra('extra:leche', 'Leche', 'leche', 'product:jugo', 300),
];

/// One product's sellable variants: a price per size, spread across every flavor
/// (or a single flavorless variant per size when [flavorKeys] is empty). Prices
/// are in cents of Bs and are the current reference price.
class _VariantGroup {
  const _VariantGroup({
    required this.productKey,
    required this.prices,
    this.flavorKeys = const [],
  });
  final String productKey;

  /// Size key -> price in cents. A product need not offer every size.
  final Map<String, int> prices;
  final List<String> flavorKeys;
}

const _variantGroups = [
  // Fresas con crema — no flavor axis.
  _VariantGroup(
    productKey: 'product:fresasConCrema',
    prices: {'size:small': 1800, 'size:large': 3200},
  ),
  _VariantGroup(
    productKey: 'product:frappe',
    prices: {'size:small': 1800, 'size:large': 2700},
    flavorKeys: [
      'flavor:oreo',
      'flavor:fresa',
      'flavor:capuccino',
      'flavor:chicle',
    ],
  ),
  // Jugos — Large only.
  _VariantGroup(
    productKey: 'product:jugo',
    prices: {'size:large': 1700},
    flavorKeys: [
      'flavor:arandano',
      'flavor:durazno',
      'flavor:limon',
      'flavor:tumbo',
      'flavor:maracuya',
      'flavor:fresa',
    ],
  ),
];

/// Ensures the fixed catalog exists: sizes, products, flavors and extras.
///
/// Idempotent — safe to call on every app launch. Rows are keyed by a
/// deterministic id ([_seedId]), so only the items missing from the current DB
/// are inserted; anything already present (including rows the user has since
/// edited) is left untouched. This is how catalog items introduced in a later
/// release reach devices that were seeded by an earlier one.
Future<void> ensureCreatedCatalog(AppDatabase db) async {
  await _ensureRows(
    db,
    db.dbSizes,
    idColumn: db.dbSizes.id,
    entries: {
      for (final s in _sizes)
        _seedId(s.key): DbSizesCompanion.insert(
          id: _seedId(s.key),
          name: s.name,
          reference: s.reference,
        ),
    },
  );

  await _ensureRows(
    db,
    db.dbProducts,
    idColumn: db.dbProducts.id,
    entries: {
      for (final p in _products)
        _seedId(p.key): DbProductsCompanion.insert(
          id: _seedId(p.key),
          name: p.name,
          icon: p.icon,
        ),
    },
  );

  await _ensureRows(
    db,
    db.dbFlavors,
    idColumn: db.dbFlavors.id,
    entries: {
      for (final f in _flavors)
        _seedId(f.key): DbFlavorsCompanion.insert(
          id: _seedId(f.key),
          name: f.name,
          icon: f.icon,
        ),
    },
  );

  await _ensureRows(
    db,
    db.dbExtras,
    idColumn: db.dbExtras.id,
    entries: {
      for (final e in _extras)
        _seedId(e.key): DbExtrasCompanion.insert(
          id: _seedId(e.key),
          productId: _seedId(e.productKey),
          name: e.name,
          price: e.price,
          icon: e.icon,
        ),
    },
  );

  await _ensureRows(
    db,
    db.dbProductVariants,
    idColumn: db.dbProductVariants.id,
    entries: {
      for (final g in _variantGroups)
        for (final flavorKey
            in (g.flavorKeys.isEmpty ? const [null] : g.flavorKeys))
          for (final size in g.prices.entries)
            _seedId('variant:${g.productKey}:${size.key}:${flavorKey ?? 'plain'}'):
                DbProductVariantsCompanion.insert(
              id: _seedId(
                  'variant:${g.productKey}:${size.key}:${flavorKey ?? 'plain'}'),
              productId: _seedId(g.productKey),
              sizeId: _seedId(size.key),
              flavorId: Value(flavorKey == null ? null : _seedId(flavorKey)),
              price: size.value,
            ),
    },
  );
}

/// Inserts the [entries] (id -> row) whose id is not already present in [table].
Future<void> _ensureRows<T extends Table, D>(
  AppDatabase db,
  TableInfo<T, D> table, {
  required GeneratedColumn<String> idColumn,
  required Map<String, Insertable<D>> entries,
}) async {
  final present = await (db.selectOnly(table)
        ..addColumns([idColumn])
        ..where(idColumn.isIn(entries.keys.toList())))
      .map((r) => r.read(idColumn)!)
      .get();

  final missing = [
    for (final entry in entries.entries)
      if (!present.contains(entry.key)) entry.value,
  ];
  if (missing.isEmpty) return;

  await db.batch((b) => b.insertAll(table, missing));
}

/// Seeds throwaway data for local testing (sample sales, etc.). Never runs in a
/// release build — callers guard it behind `kReleaseMode`.
///
/// Intentionally empty for now.
Future<void> seedDummyData(AppDatabase db) async {}
