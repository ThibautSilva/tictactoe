import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/entities/game_result.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';
import 'package:tictactoe/features/game/domain/usecases/check_winner_usecase.dart';

void main() {
  late CheckWinnerUsecase usecase;

  setUp(() {
    usecase = CheckWinnerUsecase();
  });

  group('CheckWinnerUsecase', () {
    test('returns win when first row is filled with same tile', () {
      final board = [
        Tile.x,
        Tile.x,
        Tile.x,
        Tile.empty,
        Tile.empty,
        Tile.empty,
        Tile.empty,
        Tile.empty,
        Tile.empty,
      ];

      final result = usecase(board);

      expect(result, equals(GameResult.over(winner: Tile.x)));
    });

    test('returns draw when board is full with no winner', () {
      final board = [
        Tile.x,
        Tile.o,
        Tile.x,
        Tile.x,
        Tile.o,
        Tile.o,
        Tile.o,
        Tile.x,
        Tile.x,
      ];

      final result = usecase(board);

      expect(result, equals(const GameResult.draw()));
    });

    test('returns inProgress when game is not finished', () {
      final board = List.filled(9, Tile.empty);
      final result = usecase(board);
      expect(result, equals(const GameResult.inProgress()));
    });
  });
}
