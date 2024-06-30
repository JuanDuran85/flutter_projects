// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie_entities.dart';
import 'movies_repository_provider.dart';

final StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>
    movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final Future<Movie> Function(String) movieRepository =
      ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getCallbackMovie: movieRepository);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getCallbackMovie;

  MovieMapNotifier({required this.getCallbackMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    print('Http call for $movieId');
    final movie = await getCallbackMovie(movieId);
    state = {...state, movieId: movie};
  }
}
