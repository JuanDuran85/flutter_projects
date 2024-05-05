// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:animate_do/animate_do.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Finding food',
    'Est commodo laboris tempor velit minim non.',
    'assets/images/1.png',
  ),
  SlideInfo(
      'Delivery Fast',
      'Proident sit dolore laboris laboris ipsum elit reprehenderit nostrud deserunt enim.',
      'assets/images/2.png'),
  SlideInfo(
      'Enjoy your food',
      'Commodo consectetur adipisicing sit dolore exercitation est voluptate eu velit duis magna enim.',
      'assets/images/3.png'),
];

class AppTutotialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutotialScreen({super.key});

  @override
  State<AppTutotialScreen> createState() => _AppTutotialScreenState();
}

class _AppTutotialScreenState extends State<AppTutotialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList(),
            ),
            Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                onPressed: () => context.pop(),
                child: const Text('Skip'),
              ),
            ),
            endReached
                ? Positioned(
                    bottom: 30,
                    right: 30,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(seconds: 1),
                      child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Start'),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20),
          Text(title, style: titleStyle),
          const SizedBox(height: 10),
          Text(caption, style: captionStyle),
        ],
      ),
    );
  }
}
