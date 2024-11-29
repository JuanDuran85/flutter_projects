import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
import '../../../domain/domain.dart';
import '../../presentation.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;

    final List<Movie> movie =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movie.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> favoritesMovies =
        ref.watch(favoriteMoviesProvider).values.toList();

    if (favoritesMovies.isEmpty) {
      final ColorScheme themeOfColors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border_sharp,
              size: 60,
              color: themeOfColors.primary,
            ),
            Text(
              'Nothings here...',
              style: TextStyle(color: themeOfColors.primary, fontSize: 30),
            ),
            const Text(
              'No favorite movies',
              style: TextStyle(fontSize: 20, color: Colors.black45),
            ),
            const SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: const Text('Start to search'),
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: MovieMasonry(
      movies: favoritesMovies,
    ));
  }
}
