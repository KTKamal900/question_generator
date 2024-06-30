import 'package:question_generator/models/books_model.dart';
import 'package:question_generator/models/exercise_model.dart';

import '../models/chapters_model.dart';
import '../models/qna_model.dart';

List<BooksModel> booksData = [
  BooksModel(
    title: 'Book 1',
    image: '',
    chapterModel: [
      ChaptersModel(
        title: "Chapter 1",
        exerciseModel: [
          ExerciseModel(title: "asjdhas", type: "askndk", qna: [
            QNAModel(
                mark: 2,
                answer: AnswerModel(ansKey: 'A', ansValue: "klsadknf"),
                options: [],
                question:
                    QuestionModel(quesKey: '1', quesValue: "asklndfksdfkn"))
          ])
        ],
      ),
    ],
  ),
];
