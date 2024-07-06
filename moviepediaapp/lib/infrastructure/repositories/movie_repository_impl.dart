import 'package:moviepediaapp/domain/datasources/movies_datasource.dart';
import 'package:moviepediaapp/domain/entities/movie_entities.dart';
import 'package:moviepediaapp/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) {
    return dataSource.getNowPlayingMovies(page: page);
  }

  @override
  Future<List<Movie>> getPopularsMovies({int page = 1}) {
    return dataSource.getPopularsMovies(page: page);
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) {
    return dataSource.getTopRatedMovies(page: page);
  }

  @override
  Future<List<Movie>> getUpcomingMovies({int page = 1}) {
    return dataSource.getUpcomingMovies(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }
}
