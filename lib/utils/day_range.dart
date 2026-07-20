/// Half-open day windows, `from` inclusive and `to` exclusive — the shape the
/// repository aggregates expect.
abstract final class DayRange {
  /// Local midnight today up to local midnight tomorrow.
  ///
  /// Computed per call rather than cached, so a session left open across
  /// midnight reports the new day as soon as its provider is invalidated.
  static ({DateTime from, DateTime to}) today() {
    final now = DateTime.now();
    final from = DateTime(now.year, now.month, now.day);
    return (from: from, to: from.add(const Duration(days: 1)));
  }
}
