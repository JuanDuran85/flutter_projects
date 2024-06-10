import 'package:flutter/material.dart';

import '../models/model.dart';

class MealDetailsScreen extends StatelessWidget {
  final MealModel meal;
  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Image(
        image: NetworkImage(meal.imageUrl),
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
