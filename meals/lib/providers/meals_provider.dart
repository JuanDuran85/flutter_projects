// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/data/data.dart';

import '../models/model.dart';

final Provider<List<MealModel>> mealsProvider = Provider((ref) {
  return dummyMeals;
});