import 'package:flutter/material.dart';

import '../views/views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final viewRoutes = const <Widget>[
    PurpleView(),
    GreenView(),
    TealView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: viewRoutes,
      ),
    );
  }
}