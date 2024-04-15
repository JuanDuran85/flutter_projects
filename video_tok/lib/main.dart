import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:video_tok/config/theme/app_theme.dart';
import 'package:video_tok/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:video_tok/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:video_tok/presentation/providers/discover_provider.dart';
import 'package:video_tok/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videoDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          // operador de cascada
          create: (_) =>
              DiscoverProvider(videoPostRepository: videoPostRepository)
                ..loadNextPage(),
        ),
      ],
      child: MaterialApp(
          title: 'VideoTok',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
