import 'package:tictactoe/features/game/domain/entities/difficulty_level.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';

class GameConfig {
  final Tile firstPlayerTile;
  final DifficultyLevel? difficulty;
  final GameMode gameMode;

  const GameConfig({
    required this.firstPlayerTile,
    required this.gameMode,
    this.difficulty,
  });
}
