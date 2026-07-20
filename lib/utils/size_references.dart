/// Size name -> relative magnitude, used to order sizes from smallest to
/// largest. Seeded into `DbSizes.reference`.
///
/// Values are spaced so a new size can be added between two existing ones
/// without renumbering: a Mediano would be 7 or 8.
abstract final class AppSizeReferences {
  static const String small = 'Pequeño';
  static const String large = 'Grande';

  static const Map<String, int> byName = {
    small: 5,
    large: 10,
  };
}
