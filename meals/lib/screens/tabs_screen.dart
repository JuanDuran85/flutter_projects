import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/model.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';
import 'categories_screen.dart';
import 'filters_screen.dart';
import 'meals_screen.dart';

const Map<Filter, bool> kInitialsFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<MealModel> meals = ref.watch(mealsProvider);
    final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);
    final availableMeals = meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final List<MealModel> favoriteMeals = ref.watch(favoritesMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
