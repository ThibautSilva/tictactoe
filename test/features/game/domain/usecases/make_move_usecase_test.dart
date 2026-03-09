import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';
import 'package:tictactoe/features/game/domain/usecases/make_move_usecase.dart';

void main() {
  late MakeMoveUsecase usecase;

  setUp(() {
    usecase = MakeMoveUsecase();
  });

  group('MakeMoveUsecase', () {
    test('places tile on empty cell and returns new board', () {
      final board = List.filled(9, Tile.empty);

      final result = usecase(board, 0, Tile.x);

      expect(result[0], equals(Tile.x));
    });

    test('does not modify board when cell is already occupied', () {
      final board = [
        Tile.o,
        Tile.empty,
        Tile.empty,
        Tile.empty,
        Tile.empty,
        Tile.empty,
        Tile.empty,
        Tile.empty,
        Tile.empty,
      ];

      final result = usecase(board, 0, Tile.x);

      expect(result[0], equals(Tile.o));
    });
  });
}
