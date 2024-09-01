// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';
// this solution is working but it could not preserve the state of the app when the user changes the route with the back button views
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomeView();
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
        GoRoute(
            path: '/favorites',
            builder: (context, state) {
              return const FavoritesView();
            })
      ],
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
    ),
  ],
);
// father / son route
/* GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(
            childView: FavoritesView(),
          ),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) => MovieScreen(
            movieId: state.pathParameters['id'] ?? 'no-id',
          ),
        ),
      ]), */
