import 'package:flutter/foundation.dart';
import 'package:tictactoe/core/analytics/analytics_service.dart';
import 'package:tictactoe/features/game/domain/entities/difficulty_level.dart';

class DebugAnalyticsService implements AnalyticsService {
  const DebugAnalyticsService();

  @override
  void gameStarted(DifficultyLevel difficulty) {
    debugPrint('[Analytics] gameStarted — difficulty: ${difficulty.name}');
  }

  @override
  void log(String value) {
    debugPrint('[Analytics] $value');
  }
}
