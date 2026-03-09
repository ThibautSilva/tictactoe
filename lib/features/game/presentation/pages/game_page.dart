import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/features/game/domain/entities/game_result.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';
import 'package:tictactoe/features/game/presentation/widgets/board_widget.dart';
import 'package:tictactoe/features/game/presentation/widgets/game_result_dialog.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(gameProvider, (previous, next) {
      if (next == null) return;
      final isFinished = next.result.maybeWhen(
        inProgress: () => false,
        orElse: () => true,
      );
      if (isFinished) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => GameResultDialog(
            result: next.result,
            firstPlayerTile: next.config.firstPlayerTile,
            onReplay: () {
              ref.read(gameProvider.notifier).resetGame();
              context.go('/');
            },
          ),
        );
      }
    });

    final gameState = ref.watch(gameProvider);

    if (gameState == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              'Tic Tac Toe',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              gameState.currentTile == gameState.config.firstPlayerTile
                  ? 'C\'est ton tour!'
                  : 'Au tour de l\'IA',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 48),
            BoardWidget(
              gameState: gameState,
              onTileTapped: (index) {
                ref.read(gameProvider.notifier).makeMove(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
