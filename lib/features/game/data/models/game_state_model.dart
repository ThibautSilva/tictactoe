import 'package:json_annotation/json_annotation.dart';
import 'package:tictactoe/features/game/domain/entities/difficulty_level.dart';
import 'package:tictactoe/features/game/domain/entities/game_config.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/game_result.dart';
import 'package:tictactoe/features/game/domain/entities/game_state.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';

part 'game_state_model.g.dart';

@JsonSerializable()
class GameStateModel {
  final List<String> board;
  final String currentTile;
  final String firstPlayerTile;
  final String result;
  final String? winner;
  final String? difficulty;
  final String gameMode;

  const GameStateModel({
    required this.board,
    required this.currentTile,
    required this.firstPlayerTile,
    required this.result,
    this.winner,
    this.difficulty,
    required this.gameMode,
  });

  factory GameStateModel.fromJson(Map<String, dynamic> json) =>
      _$GameStateModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameStateModelToJson(this);

  factory GameStateModel.fromDomain(GameState state) {
    return GameStateModel(
      board: state.board.map((tile) => tile.name).toList(),
      currentTile: state.currentTile.name,
      firstPlayerTile: state.config.firstPlayerTile.name,
      result: state.result.when(
        inProgress: () => 'inProgress',
        over: (winner) => 'win',
        draw: () => 'draw',
      ),
      winner: state.result.whenOrNull(over: (winner) => winner.name),
      difficulty: state.config.difficulty?.name,
      gameMode: state.config.gameMode.name,
    );
  }

  GameState toDomain() {
    return GameState(
      board: board.map((tile) => Tile.values.byName(tile)).toList(),
      currentTile: Tile.values.byName(currentTile),
      result: switch (result) {
        'win' => GameResult.over(winner: Tile.values.byName(winner!)),
        'draw' => const GameResult.draw(),
        _ => const GameResult.inProgress(),
      },
      config: GameConfig(
        firstPlayerTile: Tile.values.byName(firstPlayerTile),
        difficulty: difficulty != null
            ? DifficultyLevel.values.byName(difficulty!)
            : null,
        gameMode: GameMode.values.byName(gameMode),
      ),
    );
  }
}
