import 'package:lamu/domain/models/app_state.dart';
import 'package:lamu/domain/models/prefs_keys.dart';
import 'package:lamu/domain/providers/app/shared_prefs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AppStateNotifier extends _$AppStateNotifier {
  @override
  AppState build() {
    final prefs = ref.read(sharedPrefsProvider);
    return AppState(sampleFlag: prefs.getBool(PrefsKeys.sampleFlag) ?? false);
  }

  void toggleSampleFlag() {
    final next = state.copyWith(sampleFlag: !state.sampleFlag);
    state = next;
    ref
        .read(sharedPrefsProvider)
        .setBool(PrefsKeys.sampleFlag, next.sampleFlag)
        .ignore();
  }
}
