import 'package:tictactoe/features/game/domain/entities/game_state.dart';

abstract interface class GameRepository {
  Future<void> saveGame(GameState state);
  Future<GameState?> loadGame();
  Future<void> clearGame();
  Future<int> getWinCount();
  Future<void> incrementWinCount();
}
