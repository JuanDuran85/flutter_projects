import 'package:moviepediaapp/domain/entities/movie_entities.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlayingMovies({
    int page = 1,
  });

  Future<List<Movie>> getPopularsMovies({
    int page = 1,
  });

  Future<List<Movie>> getTopRatedMovies({
    int page = 1,
  });

  Future<List<Movie>> getUpcomingMovies({
    int page = 1,
  });

  Future<Movie> getMovieById(String id);

   Future<List<Movie>> searchMovies(String query);
}
