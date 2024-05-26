import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch<bool>(isDarkModeProvider);
    // final int seletedColor = ref.watch<int>(selectedIndexColorProvider);

    final AppTheme appTheme = ref.watch<AppTheme>(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Flutter Widget App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}

/* AppTheme(
        selectedColor: seletedColor,
        isDarkMode: isDarkMode,
      ).getTheme(),*/
