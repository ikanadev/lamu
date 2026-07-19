// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'samples_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(samples)
final samplesProvider = SamplesProvider._();

final class SamplesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Sample>>,
          List<Sample>,
          FutureOr<List<Sample>>
        >
    with $FutureModifier<List<Sample>>, $FutureProvider<List<Sample>> {
  SamplesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'samplesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$samplesHash();

  @$internal
  @override
  $FutureProviderElement<List<Sample>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Sample>> create(Ref ref) {
    return samples(ref);
  }
}

String _$samplesHash() => r'6888c3222a1a524a2cbaf74ad349d881f94a616e';
