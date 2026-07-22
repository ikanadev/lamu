import 'package:drift/drift.dart';

import 'package:lamu/db/database.dart';

/// Named `ProductSize` rather than `Size` to avoid colliding with `dart:ui`'s
/// `Size` in screens.
class ProductSize {
  final String id;
  final String name;

  /// Relative magnitude, smallest to largest. Seeded in `lib/db/seed.dart`.
  final int reference;

  const ProductSize({
    required this.id,
    required this.name,
    required this.reference,
  });

  factory ProductSize.fromDB(DbSize row) =>
      ProductSize(id: row.id, name: row.name, reference: row.reference);

  DbSizesCompanion toDB({bool isDirty = true}) {
    return DbSizesCompanion(
      id: Value(id),
      name: Value(name),
      reference: Value(reference),
      isDirty: Value(isDirty),
    );
  }
}
