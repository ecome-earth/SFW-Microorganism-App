import 'package:flutter/cupertino.dart';
import 'package:sfw_microorganisms/models/quiz_model.dart';

class QuizProvider extends ChangeNotifier {
  final QuizModel? _testQuiz = QuizModel(
    imgPath: 'assets/images/example.jpg',
    choices: {
      'Plant Matter': false,
      'dead Organism': false,
      'Seed': false,
      'Pollen': false,
      'Other (enter)': false,
    },
  );

  QuizModel? get testQuiz => _testQuiz;

  String? _previousChoice = '';
  String? get previousChoice => _previousChoice;

  void selectItem({required String choice}) {
    if (choice == previousChoice) {
      _testQuiz!.choices!
          .update(choice, (value) => !_testQuiz!.choices![choice]!);
      _previousChoice = '';
    } else if (choice != previousChoice) {
      _testQuiz!.choices!.update(choice, (value) => true);
      if (previousChoice != '')
        _testQuiz!.choices!.update(_previousChoice!, (value) => false);
    }
    notifyListeners();
  }

  void setPreviousIndex({required String choice}) {
    _previousChoice = choice;
    notifyListeners();
  }
}
