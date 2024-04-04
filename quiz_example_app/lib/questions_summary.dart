import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (dataIn) => Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          width: 48,
                        ),
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: Text(
                        ((dataIn['question_index'] as int) + 1).toString(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(dataIn['question'] as String),
                          SizedBox(
                            height: 5,
                          ),
                          Text(dataIn['user_answer'] as String),
                          Text(dataIn['correct_answer'] as String),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
