import 'chapters_model.dart';

class BooksModel {
  String title;
  String image;

  List<ChaptersModel> chapterModel;

  BooksModel(
      {required this.title, required this.chapterModel, required this.image});
}
