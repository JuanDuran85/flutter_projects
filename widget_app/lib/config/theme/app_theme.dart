import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.pinkAccent,
  Colors.orange,
  Colors.black,
  Colors.yellow,
  Colors.indigo,
  Colors.teal,
  Colors.lime,
  Colors.brown,
  Colors.purple,
  Colors.cyan,
  Colors.deepOrange,
  Colors.blueGrey,
  Colors.amber,
  Colors.deepPurple,
  Colors.grey,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.purpleAccent,
  Colors.deepPurpleAccent,
  Colors.redAccent,
  Colors.tealAccent,
  Colors.cyanAccent,
  Colors.lightBlueAccent,
  Colors.lightGreenAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(
          selectedColor >= 0,
          'Selected color must be between 0 and ${colorList.length - 1}',
        ),
        assert(
          selectedColor < colorList.length,
          'Selected color must be between 0 and ${colorList.length - 1}',
        );

  ThemeData getTheme() => ThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ));
}
