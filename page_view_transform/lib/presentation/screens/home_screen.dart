import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final viewRoutes = const <Widget>[
    PurpleView(),
    GreebView(),
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