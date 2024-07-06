// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import '../../config/constants/environment.dart';
import '../../domain/domain.dart';
import '../mappers/mapper.dart';
import '../models/models.dart';

class ActorMovieDbDatasource extends ActorsDataSource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.tmdbApyKey,
    'language': 'en-US',
  }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final Response<dynamic> response = await dio.get('/movie/$movieId/credits');
    final castResponse = CreditsResponse.fromJson(response.data);

    if (response.statusCode == 200) {
      return castResponse.cast.map((e) => ActorMapper.castToEntity(e)).toList();
    }

    return [];
  }
}
