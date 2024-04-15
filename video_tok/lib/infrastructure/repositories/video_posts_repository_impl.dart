import 'package:video_tok/domain/datasources/video_posts_datasource.dart';
import 'package:video_tok/domain/entities/video_post.dart';
import 'package:video_tok/domain/repositories/video_posts_repositories.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videoDatasource;

  VideoPostsRepositoryImpl({required this.videoDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoDatasource.getTrendingVideosByPage(page);
  }
}
