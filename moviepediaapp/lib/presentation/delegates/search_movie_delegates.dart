import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:animate_do/animate_do.dart';

import '../../domain/domain.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegates extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovie;

  SearchMovieDelegates({required this.searchMovie});

  @override
  String get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        duration: const Duration(milliseconds: 245),
        child: IconButton(
          onPressed: () => query = '',
          icon: const Icon(
            Icons.clear,
          ),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(
        Icons.arrow_back_rounded,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: searchMovie(query),
        builder: (context, snapshot) {
          final movies = snapshot.data ?? [];
          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ListTile(
                  title: Text(movie.title),
                  onTap: () => close(context, movie),
                );
              });
        });
  }
}
