// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_actions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Persists sales. The draft notifier holds the editing state; this is the only
/// thing that writes it to the database.

@ProviderFor(SaleActions)
final saleActionsProvider = SaleActionsProvider._();

/// Persists sales. The draft notifier holds the editing state; this is the only
/// thing that writes it to the database.
final class SaleActionsProvider
    extends $AsyncNotifierProvider<SaleActions, void> {
  /// Persists sales. The draft notifier holds the editing state; this is the only
  /// thing that writes it to the database.
  SaleActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saleActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saleActionsHash();

  @$internal
  @override
  SaleActions create() => SaleActions();
}

String _$saleActionsHash() => r'444f40a4b750e25d3534a9545878b73f41832600';

/// Persists sales. The draft notifier holds the editing state; this is the only
/// thing that writes it to the database.

abstract class _$SaleActions extends $AsyncNotifier<void> {
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
