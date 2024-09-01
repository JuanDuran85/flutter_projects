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
          final pageIndex = (state.pathParameters['page'] ?? 0).toString();
          return HomeScreen(
            pageIndex: int.parse(pageIndex),
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
        ]),
  ],
);
