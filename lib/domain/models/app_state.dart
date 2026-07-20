class AppState {
  final bool sampleFlag;

  /// Masks today's earnings on the Productos screen, so the figure isn't on
  /// display to whoever is standing at the counter.
  final bool hideEarnings;

  const AppState({required this.sampleFlag, required this.hideEarnings});

  AppState copyWith({bool? sampleFlag, bool? hideEarnings}) => AppState(
        sampleFlag: sampleFlag ?? this.sampleFlag,
        hideEarnings: hideEarnings ?? this.hideEarnings,
      );
}
