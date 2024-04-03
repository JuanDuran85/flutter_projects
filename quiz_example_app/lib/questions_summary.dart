import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData
          .map(
            (dataIn) => Row(
              children: [
                Text(((dataIn['question_index'] as int) + 1).toString()),
                Column(
                  children: [
                    Text(dataIn['question'] as String),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(dataIn['user_answer'] as String),
                    Text(dataIn['correct_answer'] as String),
                  ],
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
