import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF2F1F78);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.pinkAccent,
  Colors.orange,
  Colors.black,
  Colors.indigo,
  Colors.green,
  Colors.brown,
  Colors.purple,
  Colors.amber,
  Colors.teal,
  Colors.lime,
  Colors.blueGrey,
  Colors.yellow,
  Colors.deepPurple,
  Colors.cyan,
  Colors.deepOrange
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Colors must be greater than 0'),
        assert(selectedColor < _colorThemes.length,
            'Colors must be less than ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
