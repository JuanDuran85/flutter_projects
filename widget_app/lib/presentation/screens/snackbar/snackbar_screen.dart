import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBarToShow = SnackBar(
      content: const Text('Snackbar Showed...'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBarToShow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()  => showCustomSnackbar(context),
        label: const Text('Snackbar Show'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
