import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  void loadNextPage() async{
    if(isLoading || isLastPage) return;
    isLoading = true;

    final List<Movie> movie = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movie.isEmpty) {
      isLastPage = true;
    }

  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> favoritesMovies =
        ref.watch(favoriteMoviesProvider).values.toList();
    return Scaffold(
        body: MovieMasonry(
      movies: favoritesMovies,
    ));
  }
}
