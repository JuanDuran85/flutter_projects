import 'package:flutter/material.dart';
import 'package:meals/data/data.dart';
import 'package:meals/models/model.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(MealModel meal) onToggleFavorite;

  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
  });

  void _selectCategory(BuildContext context, CategoryModel category) {
    final List<MealModel> filtersMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filtersMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...availableCategories.map(
            (category) => CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(context, category),
            ),
          )
        ]);
  }
}
