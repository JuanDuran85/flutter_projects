// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepediaapp/presentation/providers/storage/local_storage_provider.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

final StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>
    favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final LocalStorageRepositoryImpl localStorageRepository =
      ref.watch(localStoreRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  bool isLoading = false;
  final int limit = 20;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({
    required this.localStorageRepository,
  }) : super(const {});

  Future<List<Movie>> loadNextPage() async {
    if (isLoading) return [];
    isLoading = true;
    final List<Movie> movies =
        await localStorageRepository.loadMovies(offset: page * 10);
    page++;
    final Map<int, Movie> tempMovieMap = <int, Movie>{};
    for (var movie in movies) {
      tempMovieMap[movie.id] = movie;
    }

    state = {...state, ...tempMovieMap};
    await Future.delayed(const Duration(milliseconds: 200));
    isLoading = false;
    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;
    if (isMovieInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
