// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';

final StateProvider<bool> isDarkModeProvider =
    StateProvider<bool>((ref) => false);

final Provider<List<Color>> colorListProvider =
    Provider<List<Color>>((ref) => colorList);

final StateProvider<int> selectedIndexColorProvider =
    StateProvider<int>((ref) => 0);
