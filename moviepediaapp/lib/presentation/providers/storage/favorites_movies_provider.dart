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
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({
    required this.localStorageRepository,
  }) : super(const {});

  Future<List<Movie>> loadNextPage() async {
    final List<Movie> movies =
        await localStorageRepository.loadMovies(limit: 10, offset: page * 10);
    page++;
    final Map<int, Movie> tempMovieMap = <int, Movie>{};
    for (var movie in movies) {
      tempMovieMap[movie.id] = movie;
    }

    state = {...state, ...tempMovieMap};

    return movies;
  }
}
