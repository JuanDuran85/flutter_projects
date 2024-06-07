// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

import 'package:moviepediaapp/config/constants/enviroment.dart';
import 'package:moviepediaapp/domain/datasources/movies_datasource.dart';
import 'package:moviepediaapp/domain/entities/movie_entities.dart';
import 'package:moviepediaapp/infrastructure/mappers/movie_mapper.dart';
import 'package:moviepediaapp/infrastructure/models/themoviedb/tmdb_response_model.dart';

class TheMovieDbDatasource extends MoviesDataSource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Enviroment.tmdbApyKey,
    'language': 'en-US',
  }));

  List<Movie> _jsonToMovie(Map<String, dynamic> json) {
    final TheMovieDbResponse movieDbResponse =
        TheMovieDbResponse.fromJson(json);
    final List<Movie> finalMovies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((movieDb) => MovieMapper.theMovieDbToEntity(movieDb))
        .toList();

    return finalMovies;
  }

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final Response<dynamic> response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getPopularsMovies({int page = 1}) async {
    final Response<dynamic> response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final Response<dynamic> response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getUpcomingMovies({int page = 1}) async {
    final Response<dynamic> response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }
}
