import 'package:flutter/material.dart';
import 'package:meals/data/data.dart';
import 'package:meals/models/model.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, CategoryModel category) {
    final List<MealModel> filtersMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filtersMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your Category'),
      ),
      body: GridView(
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
          ]),
    );
  }
}
