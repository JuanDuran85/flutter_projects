import '../domain.dart';

abstract class ActorsRepository {
    Future<List<Actor>> getActorsByMovie(String movieId) {
    throw Exception('Not Implemented');
  }
}