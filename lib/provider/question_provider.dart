import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:providertest/model/question.dart';

class QuestionProvider with ChangeNotifier {
  List<Question> questionList = [];

  addMethod() {
    int randomQuestion = 1; //getRandomInt();
    Question question;
    switch (randomQuestion) {
      case 1:
        question = ChoiceQuestion(
            questioId: "this is Question ${randomString()}",
            options: [
              randomString(),
              randomString(),
              randomString(),
              randomString()
            ]);
        break;
      case 2:
        question = MultiChoiceQuestion(
            questioId: "this is Question ${randomString()}",
            options: [
              randomString(),
              randomString(),
              randomString(),
              randomString()
            ]);
        break;
      default:
        question =
            TextFieldQuestion(questioId: "this is Question ${randomString()}");
        break;
    }
    questionList.add(question);
    notifyListeners();
  }

  int lastUpdated = 0;
  setAnswer(index, answer) {
    (questionList[index] as ChoiceQuestion).answer = answer;
    lastUpdated = index;
    notifyListeners();
  }

  int getRandomInt() {
    return math.Random().nextInt(3);
  }

  String randomString() {
    return String.fromCharCode(math.Random().nextInt(27) + 97);
  }
}
