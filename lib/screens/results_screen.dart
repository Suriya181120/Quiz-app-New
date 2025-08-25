import 'package:flutter/material.dart';
import 'package:quiz_app/components/questions_summery.dart';
import 'package:quiz_app/data/java_questions.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
    required this.onOther,
    required this.activeQuiz,
    required this.onFlutter,
  });

  final void Function() onRestart;
  final void Function(String quizType) onOther; // Pass quiz type here
  final List<String> chosenAnswers;
  final String activeQuiz;
  final void Function(String quizType) onFlutter;

  // 🔹 Choose which question set to use
  List get _currentQuestions {
    return activeQuiz == "java" ? javaQuestions : questions;
  }

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (
      var i = 0;
      i < chosenAnswers.length && i < _currentQuestions.length;
      i++
    ) {
      summary.add({
        'questions_index': i,
        'question': _currentQuestions[i].text,
        'correct_answer': _currentQuestions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = _currentQuestions.length;
    final numCorrectQuestions = getSummaryData().where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'You answered $numCorrectQuestions out of $numTotalQuestions correctly!',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.restart_alt),
              onPressed: onRestart,
              label: const Text('Restart Quiz!'),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.code),
              onPressed: () => onOther("java"),
              label: const Text('Java Questions'),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.flutter_dash),
              onPressed: () => onFlutter("flutter"),
              label: const Text('Flutter Questions'),
            ),
          ],
        ),
      ),
    );
  }
}
