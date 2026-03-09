import 'package:tictactoe/features/game/domain/entities/game_result.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';

class CheckWinnerUsecase {
  static const List<List<int>> _winLines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  GameResult call(List<Tile> board) {
    for (List<int> winLine in _winLines) {
      final firstTile = board[winLine[0]];
      final secondTile = board[winLine[1]];
      final thirdTile = board[winLine[2]];
      final set = {firstTile, secondTile, thirdTile};
      if (set.length == 1 && !set.contains(Tile.empty)) {
        return GameResult.over(winner: firstTile);
      }
    }

    if (!board.contains(Tile.empty)) {
      return GameResult.draw();
    }

    return GameResult.inProgress();
  }
}
