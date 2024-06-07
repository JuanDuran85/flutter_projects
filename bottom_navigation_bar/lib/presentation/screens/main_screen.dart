import 'package:bottom_navigation_bar/presentation/views/motors_view.dart';
import 'package:bottom_navigation_bar/presentation/views/users_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeOfColors = Theme.of(context).colorScheme;
    const screens = [MotorsView(), UsersView()];
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.car_crash),
            label: 'Warehose',
            activeIcon: const Icon(Icons.motorcycle),
            backgroundColor: themeOfColors.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_3_outlined),
            label: 'Users',
            activeIcon: const Icon(Icons.person_off_outlined),
            backgroundColor: themeOfColors.tertiary,
          ),
        ],
      ),
    );
  }
}
