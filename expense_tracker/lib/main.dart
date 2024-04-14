import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expense_tracker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    );
  }
}