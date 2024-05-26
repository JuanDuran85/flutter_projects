import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final bool isDarkMode = ref.watch<bool>(isDarkModeProvider);
    final bool isDarkMode =
        ref.watch<AppTheme>(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              //ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch<List<Color>>(colorListProvider);
    final int selectedColor = ref.watch<int>(selectedIndexColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(selectedIndexColorProvider.notifier).state = index;
          },
          activeColor: color,
          title: Text(
            'Color: ${color.value}',
            style: TextStyle(color: color),
          ),
          subtitle: Text(
            'some color description',
            style: TextStyle(color: color),
          ),
        );
      },
    );
  }
}
