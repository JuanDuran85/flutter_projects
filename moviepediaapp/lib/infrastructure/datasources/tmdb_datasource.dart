// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

import 'package:moviepediaapp/config/constants/environment.dart';
import 'package:moviepediaapp/domain/datasources/movies_datasource.dart';
import 'package:moviepediaapp/domain/entities/movie_entities.dart';
import 'package:moviepediaapp/infrastructure/mappers/mapper.dart';

import '../models/models.dart';

class TheMovieDbDatasource extends MoviesDataSource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.tmdbApyKey,
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

  @override
  Future<Movie> getMovieById(String id) async {
    final Response<dynamic> response = await dio.get('/movie/$id');

    if (response.statusCode != 200) {
      throw Exception('Failed to load movie - Id: $id, not found');
    }

    final MovieDetails movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];
    final Response<dynamic> response =
        await dio.get('/search/movie', queryParameters: {'query': query});

    if (response.statusCode != 200) {
      throw Exception('Failed to load movie - $query, not found');
    }

    return _jsonToMovie(response.data);
  }
}
