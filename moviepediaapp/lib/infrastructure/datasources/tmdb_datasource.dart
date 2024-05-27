// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:moviepediaapp/config/constants/enviroment.dart';
import 'package:moviepediaapp/domain/datasources/movies_datasource.dart';
import 'package:moviepediaapp/domain/entities/movie_entities.dart';

class TheMovieDbDatasource extends MoviesDataSource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Enviroment.tmdbApyKey,
    'language': 'en-US',
  }));
  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    


    return [];
  }
}
