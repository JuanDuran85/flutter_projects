import '../../domain/domain.dart';

class ActorRepositoryImplementation extends ActorsRepository {
  final ActorsDataSource datasource;

  ActorRepositoryImplementation({required this.datasource});

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
