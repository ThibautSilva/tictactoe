import 'dart:math';

import 'package:tictactoe/features/game/domain/entities/difficulty_level.dart';
import 'package:tictactoe/features/game/domain/entities/game_result.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';
import 'package:tictactoe/features/game/domain/usecases/check_winner_usecase.dart';

class GetAiMoveUsecase {
  final _checkWinner = CheckWinnerUsecase();

  int call(DifficultyLevel level, List<Tile> board, Tile aiTile) {
    final emptyTiles = <int>[];
    for (int i = 0; i < board.length; i++) {
      if (board[i] == Tile.empty) {
        emptyTiles.add(i);
      }
    }
    if (level == DifficultyLevel.easy) {
      final randomInt = Random().nextInt(emptyTiles.length);
      return emptyTiles[randomInt];
    } else {
      int bestScore = -1000;
      int bestIndex = emptyTiles.first;
      final humanTile = aiTile == Tile.x ? Tile.o : Tile.x;

      for (final index in emptyTiles) {
        final newBoard = List<Tile>.from(board);
        newBoard[index] = aiTile;
        final score = _minimax(newBoard, false, aiTile, humanTile);
        if (score > bestScore) {
          bestScore = score;
          bestIndex = index;
        }
      }
      return bestIndex;
    }
  }

  int _minimax(
    List<Tile> board,
    bool isMaximizing,
    Tile aiTile,
    Tile humanTile,
  ) {
    final result = _checkWinner(board);

    return result.when(
      over: (winner) => winner == aiTile ? 10 : -10,
      draw: () => 0,
      inProgress: () {
        final emptyTiles = <int>[];
        for (int i = 0; i < board.length; i++) {
          if (board[i] == Tile.empty) {
            emptyTiles.add(i);
          }
        }

        if (isMaximizing) {
          int bestScore = -1000;
          for (final index in emptyTiles) {
            final newBoard = List<Tile>.from(board);
            newBoard[index] = aiTile;
            final score = _minimax(newBoard, false, aiTile, humanTile);
            if (score > bestScore) bestScore = score;
          }
          return bestScore;
        } else {
          int bestScore = 1000;
          for (final index in emptyTiles) {
            final newBoard = List<Tile>.from(board);
            newBoard[index] = humanTile;
            final score = _minimax(newBoard, true, aiTile, humanTile);
            if (score < bestScore) bestScore = score;
          }
          return bestScore;
        }
      },
    );
  }
}
