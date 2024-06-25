import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFreeFilterSet = false;
  bool lactoseFreeFilterSet = false;
  bool veganFilterSet = false;
  bool vegetarianFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      /* drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
          }
        },
      ), */
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if(didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: glutenFreeFilterSet,
            Filter.lactoseFree: lactoseFreeFilterSet,
            Filter.vegan: veganFilterSet,
            Filter.vegetarian: vegetarianFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTileCustomWidget(glutenFreeFilterSet, 'Gluten-free',
                'Only include gluten-free meals'),
            SwitchListTileCustomWidget(lactoseFreeFilterSet, 'Lactose-free',
                'Only include lactose-free meals'),
            SwitchListTileCustomWidget(vegetarianFilterSet, 'Vegetarian',
                'Only include Vegetarian meals'),
            SwitchListTileCustomWidget(
                veganFilterSet, 'Vegan',
                'Only include Vegan meals'),
          ],
        ),
      ),
    );
  }
}
