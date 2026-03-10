// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameStateModel _$GameStateModelFromJson(Map<String, dynamic> json) =>
    _GameStateModel(
      board: (json['board'] as List<dynamic>).map((e) => e as String).toList(),
      currentTile: json['currentTile'] as String,
      firstPlayerTile: json['firstPlayerTile'] as String,
      result: json['result'] as String,
      winner: json['winner'] as String?,
      difficulty: json['difficulty'] as String?,
      gameMode: json['gameMode'] as String,
    );

Map<String, dynamic> _$GameStateModelToJson(_GameStateModel instance) =>
    <String, dynamic>{
      'board': instance.board,
      'currentTile': instance.currentTile,
      'firstPlayerTile': instance.firstPlayerTile,
      'result': instance.result,
      'winner': instance.winner,
      'difficulty': instance.difficulty,
      'gameMode': instance.gameMode,
    };
