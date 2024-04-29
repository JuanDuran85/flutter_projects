import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

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

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Licencias Usadas'),
        content: const Text(
          'Enim proident non aliqua deserunt nostrud Lorem ex velit qui aliqua. Tempor in veniam mollit occaecat esse aliquip elit laboris eu reprehenderit culpa. Consectetur ut labore id irure mollit reprehenderit amet. Elit irure occaecat reprehenderit elit ad amet aliqua velit. Fugiat Lorem voluptate sunt exercitation.',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text(
              'Cancel',
            ),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text(
              'Ok',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'lorem ipsum dolor sit amet consectetur adipiscing elit in non laoreet nibh. Nostrud excepteur labore ut nostrud nostrud sint.'),
                ]);
              },
              child: const Text('Licencias Usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Snackbar Show'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
