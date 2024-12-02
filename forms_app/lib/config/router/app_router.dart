import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

final appRputer = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cubits',
    builder: (context, state) => const CubitCounterScreen(),
  ),
]);
