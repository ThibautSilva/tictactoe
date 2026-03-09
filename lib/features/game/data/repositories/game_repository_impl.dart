import 'package:tictactoe/features/game/data/datasources/game_local_datasource.dart';
import 'package:tictactoe/features/game/data/models/game_state_model.dart';
import 'package:tictactoe/features/game/domain/entities/game_state.dart';
import 'package:tictactoe/features/game/domain/repositories/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  final GameLocalDatasource _datasource;

  GameRepositoryImpl(this._datasource);

  @override
  Future<void> saveGame(GameState state) async {
    await _datasource.saveGame(GameStateModel.fromDomain(state));
  }

  @override
  Future<GameState?> loadGame() async {
    final model = await _datasource.getGame();
    return model?.toDomain();
  }

  @override
  Future<void> clearGame() async {
    await _datasource.clearGame();
  }

  @override
  Future<int> getWinCount() async {
    return _datasource.getWinCount();
  }

  @override
  Future<void> incrementWinCount() async {
    final count = await _datasource.getWinCount();
    await _datasource.saveWinCount(count + 1);
  }
}
