import '../../domain/domain.dart';
import '../models/models.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        character: cast.character,
        profilePath: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'https://www.pngitem.com/pimgs/m/287-2876223_no-profile-picture-available-hd-png-download.png',
      );
}
