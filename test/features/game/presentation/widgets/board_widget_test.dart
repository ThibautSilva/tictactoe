import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/entities/difficulty_level.dart';
import 'package:tictactoe/features/game/domain/entities/game_config.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/game_result.dart';
import 'package:tictactoe/features/game/domain/entities/game_state.dart';
import 'package:tictactoe/features/game/domain/entities/tile.dart';
import 'package:tictactoe/features/game/presentation/widgets/board_widget.dart';

void main() {
  late GameState gameState;

  setUp(() {
    gameState = GameState(
      config: const GameConfig(
        firstPlayerTile: Tile.x,
        difficulty: DifficultyLevel.easy,
        gameMode: GameMode.ai,
      ),
      board: List.filled(9, Tile.empty),
      currentTile: Tile.x,
      result: const GameResult.inProgress(),
    );
  });

  group('BoardWidget', () {
    testWidgets('renders 9 cells', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BoardWidget(gameState: gameState, onTileTapped: (_) {}),
          ),
        ),
      );

      expect(find.byType(GestureDetector), findsNWidgets(9));
    });

    testWidgets('calls onTileTapped when cell is tapped', (tester) async {
      int? tappedIndex;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BoardWidget(
              gameState: gameState,
              onTileTapped: (index) => tappedIndex = index,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector).first);

      expect(tappedIndex, equals(0));
    });
  });
}
