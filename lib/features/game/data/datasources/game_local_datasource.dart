import 'package:tictactoe/features/game/data/models/game_state_model.dart';

abstract interface class GameLocalDatasource {
  Future<void> saveGame(GameStateModel model);
  Future<GameStateModel?> getGame();
  Future<void> clearGame();
  Future<void> saveWinCount(int count);
  Future<int> getWinCount();
}
