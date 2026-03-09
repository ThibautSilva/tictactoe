# Tic Tac Toe

A Flutter implementation of the classic Tic Tac Toe game, built as a technical test to show clean architecture, state management and good practices.

## Dependencies 

- **Flutter** 3.41.1 with FVM
- **Riverpod** — state management and dependency injection
- **GoRouter** — navigation
- **Freezed** — immutable entities
- **SharedPreferences** — local persistence
- **json_serializable** — JSON serialization

## Game modes

The game has two difficulty levels against the AI.

**Easy** — the AI picks a random empty cell.

**Hard** — the AI uses the Minimax algorithm, which explores all possible moves and always plays the best one.

## Getting started

This project uses FVM to manage the Flutter version.
```bash
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
fvm flutter run
```

## Tests

Unit tests cover only main use cases — `CheckWinnerUsecase` and `MakeMoveUsecase` — and a widget test for `BoardWidget`.

## What I would add with more time

- l10n
- Game history
- Win counter
- Select first player
- Change tile symbol (X:O)
- Human vs Human
- Animations with flutter_animate / rive
- More test coverage
- and a lot more