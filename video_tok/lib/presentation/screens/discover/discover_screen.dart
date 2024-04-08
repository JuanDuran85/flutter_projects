import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_tok/presentation/providers/discover_provider.dart';
import 'package:video_tok/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    // is the same but to read: final discoverProviderII = Provider.of<DiscoverProvider>(context, listen: false);

    return Scaffold(
      body: discoverProvider.initalLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : VideoScrollableView(
              videos: discoverProvider.videos,
            ),
    );
  }
}
