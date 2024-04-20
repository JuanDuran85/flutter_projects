import 'package:flutter/material.dart';
import 'package:widget_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),
      home: Scaffold(
        body: Center(
          child: FilledButton(
            onPressed: () {},
            child: const Text('Test Color!'),
          ),
        ),
      ),
    );
  }
}
