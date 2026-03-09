import 'package:tictactoe/features/game/domain/entities/difficulty_level.dart';

abstract interface class AnalyticsService {
  void gameStarted(DifficultyLevel difficulty);
  void log(String value);
}
