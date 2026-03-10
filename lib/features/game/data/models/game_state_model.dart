import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state_model.freezed.dart';
part 'game_state_model.g.dart';

@freezed
abstract class GameStateModel with _$GameStateModel {
  const factory GameStateModel({
    required List<String> board,
    required String currentTile,
    required String firstPlayerTile,
    required String result,
    String? winner,
    String? difficulty,
    required String gameMode,
  }) = _GameStateModel;

  factory GameStateModel.fromJson(Map<String, dynamic> json) =>
      _$GameStateModelFromJson(json);
}
