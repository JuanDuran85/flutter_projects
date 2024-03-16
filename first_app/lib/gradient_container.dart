import 'package:first_app/style_text.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colorsIn});

  final List<Color> colorsIn;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colorsIn,
            begin: startAlignment,
            end: endAlignment),
      ),
      child: const Center(
        child: StyleText('__App One__'),
      ),
    );
  }
}
