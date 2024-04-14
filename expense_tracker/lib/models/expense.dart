// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work, others }

class Expense {
  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
