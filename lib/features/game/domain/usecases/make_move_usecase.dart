import 'package:tictactoe/features/game/domain/entities/tile.dart';

class MakeMoveUsecase {
  List<Tile> call(List<Tile> board, int position, Tile tile) {
    if (board[position] != tile && board[position] == Tile.empty) {
      final newBoard = List<Tile>.from(board);
      newBoard[position] = tile;
      return newBoard;
    }
    return board;
  }
}
