import 'package:flutter/material.dart';
import 'package:quiz_example_app/data/questions.dart';
import 'package:quiz_example_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswer;
  const ResultScreen({super.key, required this.chosenAnswer});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((element) => element['user_answer'] == element['correct_answer']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Answers: $numCorrectQuestions/$numTotalQuestions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Restar Quiz!',
              ),
            )
          ],
        ),
      ),
    );
  }
}
