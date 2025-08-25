import 'package:quiz_app/models/quiz_question.dart';

const javaQuestions = [
  QuizQuestion('Which of the following is not a feature of Java?', [
    'Object-Oriented',
    'Platform Independent',
    'Automatic Memory Management',
    'Pointers',
  ]),
  QuizQuestion('Which method is the entry point of a Java program?', [
    'main(String args)',
    'start()',
    'init()',
    'public static void main(String[] args)',
  ]),
  QuizQuestion('What is the size of int data type in Java?', [
    '2 bytes',
    '8 bytes',
    'Depends on system',
    '4 bytes',
  ]),
  QuizQuestion('Which keyword is used to inherit a class in Java?', [
    'implements',
    'inherits',
    'super',
    'extends',
  ]),
  QuizQuestion('Which of these is not a Java access modifier?', [
    'public',
    'protected',
    'private',
    'friendly',
  ]),
  QuizQuestion('What is the default value of a boolean variable in Java?', [
    'true',
    'null',
    '0',
    'false',
  ]),
  QuizQuestion('Which exception is thrown when dividing by zero in Java?', [
    'NumberFormatException',
    'NullPointerException',
    'IOException',
    'ArithmeticException',
  ]),
  QuizQuestion(
    'Which of the following collections allows duplicate elements?',
    ['Set', 'Map (keys)', 'None of the above', 'List'],
  ),
  QuizQuestion(
    'Which operator is used for comparing object references in Java?',
    ['equals()', 'compareTo()', 'instanceof', '=='],
  ),
  QuizQuestion('Which of the following is not a valid Java primitive type?', [
    'int',
    'double',
    'boolean',
    'string',
  ]),
];
