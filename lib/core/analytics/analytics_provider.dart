import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/analytics/analytics_service.dart';
import 'package:tictactoe/core/analytics/debug_analytics_service.dart';

part 'analytics_provider.g.dart';

@Riverpod(keepAlive: true)
AnalyticsService analyticsService(Ref ref) {
  return const DebugAnalyticsService();
}
