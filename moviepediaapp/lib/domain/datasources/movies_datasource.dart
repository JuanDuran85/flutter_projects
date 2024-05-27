import 'package:moviepediaapp/domain/entities/movie_entities.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlayingMovies({
    int page = 1,
  });
}
