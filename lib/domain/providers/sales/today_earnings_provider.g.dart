// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_earnings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// What the store charged today, in cents.

@ProviderFor(todayEarnings)
final todayEarningsProvider = TodayEarningsProvider._();

/// What the store charged today, in cents.

final class TodayEarningsProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  /// What the store charged today, in cents.
  TodayEarningsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayEarningsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayEarningsHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return todayEarnings(ref);
  }
}

String _$todayEarningsHash() => r'facb373b6392b34b70d81b8e4e3e0278c765c374';
