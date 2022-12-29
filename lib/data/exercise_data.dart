import '../models/exercise_model.dart';

List<ExerciseModel> exerciseData = [
  ExerciseModel(
      question: QuestionModel(
          quesKey: "1",
          quesValue:
              "ßIFZ[ 3G 5NFY\"G[ UZD SZJFDF\ VFJ[ tIFZ[ S[JF 5|SFZGL 1FlT pNŸEJ[ m T[GF ,LW[ SIM EF{lTS U]6WD\" V;Z 5FD[ K[ VG[ S[JL ZLT[ m"),
      answer: AnswerModel(ansKey: "A", ansValue: "Kamal"),
      options: [
        OptionModel(
            ansKey: "->",
            ansValue:
                "3G 5NFY\"G[ UZD SZTF :Ol8SDF\\ VJSFX 1FlT pt5gG YFI K[P SFZ6 S[ T[G[ UZD SZTF VD]S ,[8F.; lA\\N]VM BF,L YFI K[P",
            ansType: 'text'),
        OptionModel(
            ansKey: "->",
            ansValue:
                "VFJL 1FlTG[ ,LW[ 38S S6M VYJF VFIGM :Ol8SDF\\YL N}Z YTF CMJFYL 3GTFDF\\ 38F0M YFI K[P",
            ansType: 'text'),
        OptionModel(
            ansKey: "", ansValue: "assets/cubeImage.png", ansType: 'image'),
      ],
      mark: 2),
  ExerciseModel(
      question: QuestionModel(
          quesKey: "2", quesValue: "Static electricity is produced due to...."),
      answer: AnswerModel(ansKey: "D", ansValue: "both (A) and (B)"),
      options: [
        OptionModel(ansKey: "A", ansValue: "friction", ansType: 'text'),
        OptionModel(ansKey: "B", ansValue: "induction", ansType: 'text'),
        OptionModel(ansKey: "C", ansValue: "electric current", ansType: 'text'),
        OptionModel(ansKey: "D", ansValue: "both (A) and (B)", ansType: 'text'),
      ],
      mark: 3),
  ExerciseModel(
      question: QuestionModel(
          quesKey: "3",
          quesValue: "To S[ÂgãT V[SDSMQF ZRGFGL 5[SÄU 1FDTF PPPPP  [2013]"),
      answer: AnswerModel(ansKey: "A", ansValue: "Kamal"),
      options: [
        OptionModel(
            ansKey: "A", ansValue: "assets/equation (5).png", ansType: 'image'),
        OptionModel(
            ansKey: "B", ansValue: "assets/equation (6).png", ansType: 'image'),
        OptionModel(
            ansKey: "C", ansValue: "assets/equation (7).png", ansType: 'image'),
        OptionModel(
            ansKey: "D", ansValue: "assets/equation (8).png", ansType: 'image'),
      ],
      mark: 2),
  ExerciseModel(
      question: QuestionModel(
          quesKey: "4",
          quesValue:
              "Ô[ NaCl GF :Ol8SDF\\ 10v4 mol % SrCl2 pD[ZJFDF\\ VFJ[ TM pNŸEJTF VJSFXGL ;\\bIF S[8,L YX[ m"),
      answer: AnswerModel(ansKey: "A", ansValue: "Kamal"),
      options: [
        OptionModel(
            ansKey: "(A)",
            ansValue: "assets/equation (1).png",
            ansType: 'image'),
        OptionModel(
            ansKey: "(B)",
            ansValue: "assets/equation (2).png",
            ansType: 'image'),
        OptionModel(
            ansKey: "(C)",
            ansValue: "assets/equation (3).png",
            ansType: 'image'),
        OptionModel(
            ansKey: "(D)",
            ansValue: "assets/equation (4).png",
            ansType: 'image'),
      ],
      mark: 1),
];
