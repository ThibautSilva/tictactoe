import 'package:flutter/material.dart';
import 'package:tictactoe/features/game/domain/entities/game_state.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';

class BoardWidget extends StatelessWidget {
  final GameState gameState;
  final void Function(int index) onTileTapped;

  const BoardWidget({
    super.key,
    required this.gameState,
    required this.onTileTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          final tile = gameState.board[index];
          return GestureDetector(
            onTap: () => onTileTapped(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: index < 3 ? BorderSide.none : const BorderSide(width: 2),
                  left: index % 3 == 0
                      ? BorderSide.none
                      : const BorderSide(width: 2),
                  right: BorderSide.none,
                  bottom: BorderSide.none,
                ),
              ),
              child: Center(
                child: Text(
                  tile == Tile.x
                      ? 'X'
                      : tile == Tile.o
                      ? 'O'
                      : '',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: tile == Tile.x
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
