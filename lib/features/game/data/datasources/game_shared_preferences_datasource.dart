import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/core/constants/storage_keys.dart';
import 'package:tictactoe/features/game/data/datasources/game_local_datasource.dart';
import 'package:tictactoe/features/game/data/models/game_state_model.dart';

class GameSharedPreferencesDatasource implements GameLocalDatasource {
  final SharedPreferences _prefs;

  GameSharedPreferencesDatasource(this._prefs);

  @override
  Future<void> saveGame(GameStateModel model) async {
    await _prefs.setString(StorageKeys.gameSaved, jsonEncode(model.toJson()));
  }

  @override
  Future<GameStateModel?> getGame() async {
    final gameString = _prefs.getString(StorageKeys.gameSaved);
    if (gameString == null) return null;
    return GameStateModel.fromJson(
      jsonDecode(gameString) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> clearGame() async {
    await _prefs.remove(StorageKeys.gameSaved);
  }

  @override
  Future<void> saveWinCount(int count) async {
    await _prefs.setInt(StorageKeys.winCount, count);
  }

  @override
  Future<int> getWinCount() async {
    return _prefs.getInt(StorageKeys.winCount) ?? 0;
  }
}
