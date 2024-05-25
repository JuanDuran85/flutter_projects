import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/counter_provider.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch<int>(counterProvider);
    final bool darkModeActive = ref.watch<bool>(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(darkModeActive ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              //ref.read(isDarkModeProvider.notifier).state = !darkModeActive;
              ref.read(isDarkModeProvider.notifier).update((state) => !state); // another alternative
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          //ref.read(counterProvider.notifier).update((state) => state + 1); alternative
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
