import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/features/game/presentation/pages/game_page.dart';
import 'package:tictactoe/features/game/presentation/pages/home_page.dart';

part 'app_router.g.dart';

enum AppRoute { home, game }

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/game',
        name: AppRoute.game.name,
        builder: (context, state) => const GamePage(),
      ),
    ],
  );
}
