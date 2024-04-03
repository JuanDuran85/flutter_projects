import 'package:flutter/material.dart';
import 'package:quiz_example_app/data/questions.dart';
import 'package:quiz_example_app/screen/questions_screen.dart';
import 'package:quiz_example_app/screen/results_screen.dart';
import 'package:quiz_example_app/screen/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswers,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255, 107, 15, 168),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
