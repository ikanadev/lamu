import 'package:lamu/domain/models/sample.dart';
import 'package:lamu/domain/repository/sample_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'samples_provider.g.dart';

@riverpod
Future<List<Sample>> samples(Ref ref) {
  return ref.watch(sampleRepositoryProvider).listSamples();
}
