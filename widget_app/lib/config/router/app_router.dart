// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

import '../../presentation/screens/screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      name: ProgressScreen.name,
      path: '/progress',
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      name: SnackbarScreen.name,
      path: '/snackbars',
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      name: AnimatedScreen.name,
      path: '/animated',
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      name: UiControlScreen.name,
      path: '/ui-controls',
      builder: (context, state) => const UiControlScreen(),
    ),
    GoRoute(
      name: AppTutotialScreen.name,
      path: '/tutorial',
      builder: (context, state) => const AppTutotialScreen(),
    ),
    GoRoute(
      name: InfiniteScrollScreen.name,
      path: '/infinite-scroll',
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      name: CounterScreen.name,
      path: '/counter-screen',
      builder: (context, state) => const CounterScreen(),
    ),
  ],
);
