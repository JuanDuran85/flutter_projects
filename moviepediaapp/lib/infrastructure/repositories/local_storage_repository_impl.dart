import '../../domain/domain.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  @override
  Future<bool> isMovieFavorited(int movieId) {
    // TODO: implement isMovieFavorited
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    // TODO: implement loadMovies
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }

}