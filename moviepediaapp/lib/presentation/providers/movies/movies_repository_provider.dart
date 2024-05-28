// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepediaapp/infrastructure/datasources/tmdb_datasource.dart';
import 'package:moviepediaapp/infrastructure/repositories/movie_repositories_impl.dart';

// inmutable provider
final Provider<MovieRepositoryImpl> movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(TheMovieDbDatasource());
});
