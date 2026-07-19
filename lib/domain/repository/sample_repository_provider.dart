import 'package:lamu/db/db_provider.dart';
import 'package:lamu/domain/repository/sample_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sample_repository_provider.g.dart';

@riverpod
SampleRepository sampleRepository(Ref ref) {
  final db = ref.watch(dbProvider);
  return SampleRepository(db);
}
