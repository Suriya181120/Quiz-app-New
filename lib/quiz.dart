import 'package:flutter/material.dart';
import 'package:quiz_app/data/java_questions.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/screens/java_questions_screen.dart'; // <-- Import Java quiz screen

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void javaQuiz(String _) {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'java_questions'; // switch to java quiz screen
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      String activeQuiz = activeScreen;
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
        onOther: javaQuiz,
        onFlutter: (String _) => restartQuiz(),
        activeQuiz: activeQuiz,
        // <-- when clicking this, it goes to java quiz
      );
    }

    if (activeScreen == 'java_questions') {
      screenWidget = JavaQuestionsScreen(
        // <-- your new Java quiz screen
        onSelectAnswer: (answer) {
          selectedAnswers.add(answer);

          if (selectedAnswers.length == javaQuestions.length) {
            setState(() {
              activeScreen = 'results-screen';
            });
          }
        },
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 122, 70, 212),
                Color.fromARGB(255, 71, 38, 128),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
