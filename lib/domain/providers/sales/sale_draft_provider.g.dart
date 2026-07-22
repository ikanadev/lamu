// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_draft_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Session state for the sale sheet: the list of lines, which one is open, and
/// the final-amount override. Auto-disposes when the sheet closes, so each sale
/// starts from a clean draft.
///
/// Seed it once on open with [seed]. Selections that change the resolved
/// variant ([selectSize], [selectFlavor], [selectProduct]) recompute it against
/// the product's variants; extras and quantity don't affect resolution.

@ProviderFor(SaleDraftNotifier)
final saleDraftProvider = SaleDraftNotifierProvider._();

/// Session state for the sale sheet: the list of lines, which one is open, and
/// the final-amount override. Auto-disposes when the sheet closes, so each sale
/// starts from a clean draft.
///
/// Seed it once on open with [seed]. Selections that change the resolved
/// variant ([selectSize], [selectFlavor], [selectProduct]) recompute it against
/// the product's variants; extras and quantity don't affect resolution.
final class SaleDraftNotifierProvider
    extends $NotifierProvider<SaleDraftNotifier, SaleDraft> {
  /// Session state for the sale sheet: the list of lines, which one is open, and
  /// the final-amount override. Auto-disposes when the sheet closes, so each sale
  /// starts from a clean draft.
  ///
  /// Seed it once on open with [seed]. Selections that change the resolved
  /// variant ([selectSize], [selectFlavor], [selectProduct]) recompute it against
  /// the product's variants; extras and quantity don't affect resolution.
  SaleDraftNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saleDraftProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saleDraftNotifierHash();

  @$internal
  @override
  SaleDraftNotifier create() => SaleDraftNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaleDraft value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaleDraft>(value),
    );
  }
}

String _$saleDraftNotifierHash() => r'2b925b4f468f0e873f636e31fecab21a9e297696';

/// Session state for the sale sheet: the list of lines, which one is open, and
/// the final-amount override. Auto-disposes when the sheet closes, so each sale
/// starts from a clean draft.
///
/// Seed it once on open with [seed]. Selections that change the resolved
/// variant ([selectSize], [selectFlavor], [selectProduct]) recompute it against
/// the product's variants; extras and quantity don't affect resolution.

abstract class _$SaleDraftNotifier extends $Notifier<SaleDraft> {
  SaleDraft build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SaleDraft, SaleDraft>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SaleDraft, SaleDraft>,
              SaleDraft,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
