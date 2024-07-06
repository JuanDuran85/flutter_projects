// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/infrastructure.dart';

// immutable provider
final Provider<MovieRepositoryImpl> movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(TheMovieDbDatasource());
});
