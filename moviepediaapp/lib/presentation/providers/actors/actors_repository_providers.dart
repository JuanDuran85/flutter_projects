// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/infrastructure.dart';

// immutable provider
final Provider<ActorRepositoryImplementation> actorRepositoryProvider =
    Provider((ref) {
  return ActorRepositoryImplementation(datasource: ActorMovieDbDatasource());
});
