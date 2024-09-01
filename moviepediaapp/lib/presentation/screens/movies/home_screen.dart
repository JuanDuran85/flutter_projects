import 'package:flutter/material.dart';

import '../../presentation.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final Widget childView;

  const HomeScreen({
    super.key,
    required this.childView,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritesView(),
      bottomNavigationBar: CustomButtonNavigationBar(),
    );
  }
}
