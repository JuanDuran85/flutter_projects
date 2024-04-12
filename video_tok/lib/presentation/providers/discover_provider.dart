import 'package:flutter/material.dart';

import 'package:video_tok/domain/entities/video_post.dart';
import 'package:video_tok/infrastructure/models/local_video_model.dart';
import 'package:video_tok/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initalLoading = true;
  List<VideoPost> videos = [];
  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 1));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
    videos.addAll(newVideos);
    initalLoading = false;
    notifyListeners();
  }
}
