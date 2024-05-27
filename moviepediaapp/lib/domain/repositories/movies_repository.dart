import 'package:moviepediaapp/domain/entities/movie_entities.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlayingMovies({
    int page = 1,
  });
}
