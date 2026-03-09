import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/widgets/app_button.dart';
import 'package:tictactoe/features/game/domain/entities/difficulty_level.dart';
import 'package:tictactoe/features/game/domain/entities/game_config.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tic Tac Toe',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 48),
            AppButton(
              label: 'Facile',
              onPressed: () async {
                await ref
                    .read(gameProvider.notifier)
                    .startGame(
                      GameConfig(
                        firstPlayerTile: Tile.x,
                        difficulty: DifficultyLevel.easy,
                        gameMode: GameMode.ai,
                      ),
                    );
                if (context.mounted) context.push('/game');
              },
            ),
            const SizedBox(height: 16),
            AppButton(
              label: 'Difficile',
              onPressed: () async {
                ref
                    .read(gameProvider.notifier)
                    .startGame(
                      GameConfig(
                        firstPlayerTile: Tile.x,
                        difficulty: DifficultyLevel.hard,
                        gameMode: GameMode.ai,
                      ),
                    );
                if (context.mounted) context.push('/game');
              },
            ),
          ],
        ),
      ),
    );
  }
}
