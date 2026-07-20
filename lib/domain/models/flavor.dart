import 'package:drift/drift.dart';

import 'package:lamu/db/database.dart';

class Flavor {
  final String id;
  final String name;
  final String icon;

  const Flavor({required this.id, required this.name, required this.icon});

  factory Flavor.fromDB(DbFlavor row) =>
      Flavor(id: row.id, name: row.name, icon: row.icon);

  DbFlavorsCompanion toDB({bool isDirty = true}) {
    return DbFlavorsCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      isDirty: Value(isDirty),
    );
  }
}
