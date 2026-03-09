import 'package:flutter/material.dart';
import 'package:tictactoe/core/widgets/app_button.dart';
import 'package:tictactoe/features/game/domain/entities/game_result.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';

class GameResultDialog extends StatelessWidget {
  final GameResult result;
  final Tile firstPlayerTile;
  final VoidCallback onReplay;

  const GameResultDialog({
    super.key,
    required this.result,
    required this.firstPlayerTile,
    required this.onReplay,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      title: Text(
        result.when(
          inProgress: () => '',
          over: (winner) =>
              winner == firstPlayerTile ? 'T\'as gagné!' : 'Perdu !',
          draw: () => 'Egalité!',
        ),
        textAlign: TextAlign.center,
        style: Theme.of(
          context,
        ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [AppButton(label: 'Rejouer', onPressed: onReplay)],
    );
  }
}
