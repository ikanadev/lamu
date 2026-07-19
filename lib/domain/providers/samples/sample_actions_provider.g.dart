// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_actions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SampleActions)
final sampleActionsProvider = SampleActionsProvider._();

final class SampleActionsProvider
    extends $AsyncNotifierProvider<SampleActions, void> {
  SampleActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sampleActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sampleActionsHash();

  @$internal
  @override
  SampleActions create() => SampleActions();
}

String _$sampleActionsHash() => r'7e65e36ee3917633aa132592b33625af2d47894a';

abstract class _$SampleActions extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
