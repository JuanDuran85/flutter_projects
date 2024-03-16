import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.textIn, {super.key});

  final String textIn;

  @override
  Widget build(context) {
    return Text(
      textIn,
      style: const TextStyle(fontSize: 28, color: Colors.white),
    );
  }
}
