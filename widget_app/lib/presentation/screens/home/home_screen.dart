import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/manu_items.dart';
import 'package:widget_app/presentation/screens/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App + Material'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final MenuItem colorIndex = appMenuItems[index];
        return _CustomListTile(colorIndex: colorIndex);
      },
      itemCount: appMenuItems.length,
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.colorIndex,
  });

  final MenuItem colorIndex;

  @override
  Widget build(BuildContext context) {
    final themeOfColors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        colorIndex.icon,
        color: themeOfColors.primary,
      ),
      trailing:
          Icon(Icons.arrow_forward_ios_rounded, color: themeOfColors.primary),
      title: Text(colorIndex.title),
      subtitle: Text(colorIndex.subtitle),
      onTap: () {
        context.push(colorIndex.link);
        //context.pushNamed(CardsScreen.name);
      },
    );
  }
}
