import 'package:tictactoe/features/game/data/datasources/game_local_datasource.dart';
import 'package:tictactoe/features/game/data/models/game_state_model.dart';
import 'package:tictactoe/features/game/domain/entities/difficulty_level.dart';
import 'package:tictactoe/features/game/domain/entities/game_config.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/game_result.dart';
import 'package:tictactoe/features/game/domain/entities/game_state.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';
import 'package:tictactoe/features/game/domain/repositories/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  final GameLocalDatasource _datasource;

  GameRepositoryImpl(this._datasource);

  @override
  Future<void> saveGame(GameState state) async {
    await _datasource.saveGame(
      GameStateModel(
        board: state.board.map((t) => t.name).toList(),
        currentTile: state.currentTile.name,
        firstPlayerTile: state.config.firstPlayerTile.name,
        result: state.result.when(
          inProgress: () => 'inProgress',
          over: (winner) => 'over',
          draw: () => 'draw',
        ),
        winner: state.result.whenOrNull(over: (winner) => winner.name),
        difficulty: state.config.difficulty?.name,
        gameMode: state.config.gameMode.name,
      ),
    );
  }

  @override
  Future<GameState?> loadGame() async {
    final model = await _datasource.getGame();
    if (model == null) return null;
    return GameState(
      board: model.board.map((t) => Tile.values.byName(t)).toList(),
      currentTile: Tile.values.byName(model.currentTile),
      result: switch (model.result) {
        'over' => GameResult.over(winner: Tile.values.byName(model.winner!)),
        'draw' => const GameResult.draw(),
        _ => const GameResult.inProgress(),
      },
      config: GameConfig(
        firstPlayerTile: Tile.values.byName(model.firstPlayerTile),
        difficulty: model.difficulty != null
            ? DifficultyLevel.values.byName(model.difficulty!)
            : null,
        gameMode: GameMode.values.byName(model.gameMode),
      ),
    );
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
