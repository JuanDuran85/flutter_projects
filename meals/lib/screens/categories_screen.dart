import 'package:flutter/material.dart';
import 'package:meals/data/data.dart';
import 'package:meals/models/model.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/widgets.dart';

class CategoriesScreen extends StatefulWidget {
  final List<MealModel> availableMeals;
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0.0,
        upperBound: 1.0);

      _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, CategoryModel category) {
    final List<MealModel> filtersMeals = widget.availableMeals
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
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      builder: (context, child) => Padding(
          padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
          child: child),
    );
  }
}
