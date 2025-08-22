import 'package:quiz_app/models/quiz_question.dart';

const questions = [
  QuizQuestion('What are the main building blocks of Flutter UIs?', [
    'Components',
    'Blocks',
    'Functions',
    'Widgets',
  ]),
  QuizQuestion('How are Flutter UIs built?', [
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
    'By combining widgets in code',
  ]),
  QuizQuestion('What\'s the purpose of a StatefulWidget?', [
    'Update data as UI changes',
    'Ignore data changes',
    'Render UI that does not depend on data',
    'Update UI as data changes',
  ]),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
      'StatelessWidget',
    ],
  ),
  QuizQuestion('What happens if you change data in a StatelessWidget?', [
    'The UI is updated',
    'The closest StatefulWidget is updated',
    'Any nested StatefulWidgets are updated',
    'The UI is not updated',
  ]),
  QuizQuestion('How should you update data inside of StatefulWidgets?', [
    'By calling updateData()',
    'By calling updateUI()',
    'By calling updateState()',
    'By calling setState()',
  ]),
];
