import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/features/game/data/datasources/game_local_datasource.dart';
import 'package:tictactoe/features/game/data/datasources/game_shared_preferences_datasource.dart';
import 'package:tictactoe/features/game/data/repositories/game_repository_impl.dart';
import 'package:tictactoe/features/game/domain/repositories/game_repository.dart';

part 'game_providers.g.dart';

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}

@riverpod
GameLocalDatasource gameLocalDatasource(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return GameSharedPreferencesDatasource(prefs);
}

@riverpod
GameRepository gameRepository(Ref ref) {
  final datasource = ref.watch(gameLocalDatasourceProvider);
  return GameRepositoryImpl(datasource);
}
