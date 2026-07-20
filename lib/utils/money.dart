/// Formatting for monetary values. Everything in the app stores and passes
/// money as a whole number of cents of Bs; these are the only places it becomes
/// a decimal, and they produce strings, never numbers to compute with.
abstract final class Money {
  static const String symbol = 'Bs';

  /// `1800` -> `'18.00'`.
  static String format(int cents) {
    final sign = cents < 0 ? '-' : '';
    final abs = cents.abs();
    final bolivianos = abs ~/ 100;
    final remainder = (abs % 100).toString().padLeft(2, '0');
    return '$sign$bolivianos.$remainder';
  }

  /// `1800` -> `'18.00 Bs'`. Symbol trails the amount, as written locally.
  static String formatWithSymbol(int cents) => '${format(cents)} $symbol';

  /// Stand-in for a masked amount, shaped like a formatted one so hiding a
  /// value doesn't shift the layout around it.
  static const String maskedWithSymbol = '***.** $symbol';
}
