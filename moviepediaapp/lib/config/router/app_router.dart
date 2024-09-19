// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final int pageIndex =
            int.parse((state.pathParameters['page'] ?? 0).toString());
        if (pageIndex < 0 || pageIndex > 2) {
          return const HomeScreen(pageIndex: 0);
        }
        return HomeScreen(
          pageIndex: pageIndex,
        );
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) => MovieScreen(
            movieId: state.pathParameters['id'] ?? 'no-id',
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
