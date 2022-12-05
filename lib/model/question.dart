abstract class Question {
  String questioId;
  Question({required this.questioId});
}

mixin SingleAnswerMixin {
  String? answer;
}

mixin MultiplAnswerMixin {
  List<String>? answerList;
}

class TextFieldQuestion extends Question with SingleAnswerMixin{
  TextFieldQuestion({required super.questioId});
}

class ChoiceQuestion extends Question with SingleAnswerMixin {
  List<String> options;
  ChoiceQuestion({required super.questioId, required this.options});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoiceQuestion &&
          runtimeType == other.runtimeType &&
          answer == other.answer;

  @override
  int get hashCode => answer.hashCode;

  @override
  String toString(){
    return answer??"--";
  }

}

class MultiChoiceQuestion extends Question with MultiplAnswerMixin {
  List<String> options;
  MultiChoiceQuestion({required this.options, required super.questioId});
  
}
