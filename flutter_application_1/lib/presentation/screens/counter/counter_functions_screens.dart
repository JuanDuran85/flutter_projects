import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clicksCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Functions'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clicksCounter = 0;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clicksCounter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                'Click${clicksCounter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomFloatingActionButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                setState(
                  () {
                    clicksCounter = 0;
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFloatingActionButton(
              icon: Icons.exposure_minus_1,
              onPressed: () {
                setState(
                  () {
                    if (clicksCounter == 0) return;
                    clicksCounter--;
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFloatingActionButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clicksCounter++;
                });
              },
            ),
          ],
        ));
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomFloatingActionButton(
      {super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
