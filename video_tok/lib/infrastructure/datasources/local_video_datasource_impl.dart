import 'package:video_tok/domain/datasources/video_posts_datasource.dart';
import 'package:video_tok/domain/entities/video_post.dart';
import 'package:video_tok/infrastructure/models/local_video_model.dart';
import 'package:video_tok/shared/data/local_video_post.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(milliseconds: 900));
    return videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
  }
}
