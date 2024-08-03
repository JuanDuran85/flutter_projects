// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/model.dart';

class FavoriteMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(MealModel meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<MealModel>>((ref) {
  return FavoriteMealsNotifier();
});
