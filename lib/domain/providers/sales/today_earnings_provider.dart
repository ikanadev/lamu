import 'package:lamu/domain/repository/sale_repository_provider.dart';
import 'package:lamu/utils/day_range.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'today_earnings_provider.g.dart';

/// What the store charged today, in cents.
@riverpod
Future<int> todayEarnings(Ref ref) {
  final today = DayRange.today();

  return ref
      .watch(saleRepositoryProvider)
      .totalEarned(from: today.from, to: today.to);
}
