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

  @override
  void initState() {
    super.initState();

    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }


  @override
  Widget build(BuildContext context) {

    final Map<int, Movie> favoritesMovies = ref.watch(favoriteMoviesProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: favoritesMovies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Movie $index'),
            subtitle: Text(favoritesMovies.values.toList()[index].title),
          );
        },
      ),
    );
  }
}
