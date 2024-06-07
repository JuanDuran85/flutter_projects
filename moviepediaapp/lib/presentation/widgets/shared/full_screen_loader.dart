import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessage() {
    final messages = <String>[
      'Loading',
      'Loading Popular',
      'Loading Top Rated',
      'Loading Upcoming',
      'This is actually loading',
      'Loading Now Playing',
      'Upss... Its taking longer than expected',
    ];

    return Stream.periodic(
      const Duration(
        milliseconds: 1250,
      ),
      (step) {
        return messages[step];
      },
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Loading...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
              stream: getLoadingMessage(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Loading...');
                return Text(snapshot.data!);
              })
        ],
      ),
    );
  }
}
