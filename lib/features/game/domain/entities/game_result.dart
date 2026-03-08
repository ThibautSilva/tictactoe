import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';

part 'game_result.freezed.dart';

@freezed
sealed class GameResult with _$GameResult {
  const factory GameResult.inProgress() = _InProgress;
  const factory GameResult.over({required Tile winner}) = _Win;
  const factory GameResult.draw() = _Draw;
}
