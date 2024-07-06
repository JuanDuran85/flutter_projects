import '../domain.dart';

abstract class ActorsDataSource {
  Future<List<Actor>> getActorsByMovie(String movieId);
}