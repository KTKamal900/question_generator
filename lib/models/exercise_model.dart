class ExerciseModel {
  QuestionModel question;
  int mark;
  AnswerModel answer;
  List<OptionModel> options;

  ExerciseModel(
      {required this.question,
      required this.answer,
      required this.options,
      required this.mark});
}

// Options Model
class OptionModel {
  String ansKey;
  var ansValue;
  String ansType;

  OptionModel(
      {required this.ansKey, required this.ansValue, required this.ansType});
}

// Answer Model
class AnswerModel {
  String? ansKey;
  String? ansValue;

  AnswerModel({required this.ansKey, required this.ansValue});
}

// Question Model
class QuestionModel {
  String? quesKey;
  String? quesValue;

  QuestionModel({required this.quesKey, required this.quesValue});
}
