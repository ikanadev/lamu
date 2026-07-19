import 'package:lamu/domain/providers/samples/samples_provider.dart';
import 'package:lamu/domain/repository/sample_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_actions_provider.g.dart';

@Riverpod(keepAlive: true)
class SampleActions extends _$SampleActions {
  @override
  FutureOr<void> build() {}

  Future<void> createSample({required String name}) async {
    await ref.read(sampleRepositoryProvider).createSample(name: name);
    ref.invalidate(samplesProvider);
  }

  Future<void> deleteSample({required String id}) async {
    await ref.read(sampleRepositoryProvider).deleteSample(id: id);
    ref.invalidate(samplesProvider);
  }
}
