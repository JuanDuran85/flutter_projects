import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/manu_items.dart';

class SideManu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideManu({super.key, required this.scaffoldKey});

  @override
  State<SideManu> createState() => _SideManuState();
}

class _SideManuState extends State<SideManu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItemSelected = appMenuItems[value];
        context.push(menuItemSelected.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Main'),
        ),
        ...appMenuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More Options'),
        ),
        ...appMenuItems.sublist(3).map((item) => NavigationDrawerDestination(
              icon: Icon(item.icon),
              label: Text(item.title),
            ))
      ],
    );
  }
}
