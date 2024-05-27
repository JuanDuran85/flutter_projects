import 'package:moviepediaapp/domain/datasources/movies_datasource.dart';
import 'package:moviepediaapp/domain/entities/movie_entities.dart';
import 'package:moviepediaapp/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource dataSource;

  MovieRepositoryImpl({required this.dataSource});

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) {
    return dataSource.getNowPlayingMovies(page: page);
  }
}
