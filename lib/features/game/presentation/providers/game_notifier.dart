import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/analytics/analytics_provider.dart';
import 'package:tictactoe/core/analytics/analytics_service.dart';
import 'package:tictactoe/features/game/data/providers/game_providers.dart';
import 'package:tictactoe/features/game/domain/entities/difficulty_level.dart';
import 'package:tictactoe/features/game/domain/entities/game_config.dart';
import 'package:tictactoe/features/game/domain/entities/game_result.dart';
import 'package:tictactoe/features/game/domain/entities/game_state.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';
import 'package:tictactoe/features/game/domain/repositories/game_repository.dart';
import 'package:tictactoe/features/game/domain/usecases/check_winner_usecase.dart';
import 'package:tictactoe/features/game/domain/usecases/get_ai_move_usecase.dart';
import 'package:tictactoe/features/game/domain/usecases/make_move_usecase.dart';

part 'game_notifier.g.dart';

@Riverpod(keepAlive: true)
class GameNotifier extends _$GameNotifier {
  final _makeMove = MakeMoveUsecase();
  final _checkWinner = CheckWinnerUsecase();
  final _getAiMove = GetAiMoveUsecase();
  late GameRepository _repository;
  late AnalyticsService _analytics;

  @override
  GameState? build() {
    _repository = ref.watch(gameRepositoryProvider);
    _analytics = ref.watch(analyticsServiceProvider);
    return null;
  }

  Future<void> startGame(GameConfig config) async {
    _analytics.gameStarted(config.difficulty ?? DifficultyLevel.easy);
    final initialState = GameState(
      config: config,
      board: List.filled(9, Tile.empty),
      currentTile: config.firstPlayerTile,
      result: const GameResult.inProgress(),
    );
    state = initialState;
    await _repository.saveGame(initialState);
  }

  Future<void> makeMove(int index) async {
    if (!_canPlay()) return;
    await _applyHumanMove(index);
    if (_canPlay()) await _applyAiMove();
  }

  bool _canPlay() {
    final currentState = state;
    if (currentState == null) return false;
    return currentState.result.maybeWhen(
      inProgress: () => true,
      orElse: () => false,
    );
  }

  Future<void> _applyHumanMove(int index) async {
    final currentState = state!;

    final newBoard = _makeMove(
      currentState.board,
      index,
      currentState.currentTile,
    );

    final result = _checkWinner(newBoard);

    state = currentState.copyWith(
      board: newBoard,
      currentTile: currentState.currentTile == Tile.x ? Tile.o : Tile.x,
      result: result,
    );

    await _repository.saveGame(state!);

    if (!result.maybeWhen(inProgress: () => true, orElse: () => false)) {
      if (result ==
          GameResult.over(winner: currentState.config.firstPlayerTile)) {
        await _repository.incrementWinCount();
      }
      await _repository.clearGame();
    }
  }

  Future<void> _applyAiMove() async {
    final currentState = state!;
    final aiTile = currentState.currentTile;

    final aiIndex = _getAiMove(
      currentState.config.difficulty ?? DifficultyLevel.easy,
      currentState.board,
      aiTile,
    );

    final newBoard = _makeMove(currentState.board, aiIndex, aiTile);
    final result = _checkWinner(newBoard);

    state = currentState.copyWith(
      board: newBoard,
      currentTile: aiTile == Tile.x ? Tile.o : Tile.x,
      result: result,
    );

    await _repository.saveGame(state!);

    if (!result.maybeWhen(inProgress: () => true, orElse: () => false)) {
      await _repository.clearGame();
    }
  }

  void resetGame() {
    state = null;
  }
}
