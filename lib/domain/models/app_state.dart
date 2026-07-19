class AppState {
  final bool sampleFlag;

  const AppState({required this.sampleFlag});

  AppState copyWith({bool? sampleFlag}) =>
      AppState(sampleFlag: sampleFlag ?? this.sampleFlag);
}
