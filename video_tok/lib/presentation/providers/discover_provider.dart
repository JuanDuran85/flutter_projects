import 'package:flutter/material.dart';

import 'package:video_tok/domain/entities/video_post.dart';
import 'package:video_tok/domain/repositories/video_posts_repositories.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;
  bool initalLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 1));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initalLoading = false;
    notifyListeners();
  }
}
