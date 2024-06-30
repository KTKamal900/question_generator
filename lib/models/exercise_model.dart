import 'qna_model.dart';

class ExerciseModel {
  String title;
  String type;
  List<QNAModel> qna;

  ExerciseModel({required this.title, required this.type, required this.qna});
}
