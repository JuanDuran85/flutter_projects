import 'dart:io';

import 'package:isar/isar.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

import '../../domain/domain.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final Directory dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([MovieSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance()!);
  }

  @override
  Future<bool> isMovieFavorited(int movieId) async {
    final Isar isar = await db;
    final Movie? isFavoritedMovie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();
    return isFavoritedMovie != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 1000, int offset = 0}) async {
    final Isar isar = await db;
    return await isar.movies.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final Isar isar = await db;
    final Movie? favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (favoriteMovie != null) {
      // favorite delete
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return;
    }

    // favorite insert
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}
