import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../api/pdf_api.dart';
import '../data/exercise_data.dart';
import '../models/exercise_one_model.dart';
import '../utils/pdf_generator.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  List<ExerciseOneModel> exrList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                ...exrList
                    .map((e) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        color: e.mark == 1
                            ? Colors.blue
                            : e.mark == 2
                                ? Colors.red
                                : Colors.orange,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.question!.quesKey.toString()),
                        )))
                    .toList()
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: exerciseData.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      ExerciseOneModel currentExercise = exerciseData[index];
                      if (exrList.contains(currentExercise)) {
                        exrList.remove(currentExercise);
                      } else {
                        exrList.add(currentExercise);
                        exrList.sort((a, b) => (a.question.quesKey ?? "")
                            .compareTo(b.question.quesKey ?? ""));
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: exrList.contains(exerciseData[index]) &&
                                  exerciseData[index].mark == 1
                              ? Colors.blue
                              : exerciseData[index].mark == 1
                                  ? Colors.blue.shade100
                                  : exrList.contains(exerciseData[index]) &&
                                          exerciseData[index].mark == 2
                                      ? Colors.red
                                      : exerciseData[index].mark == 2
                                          ? Colors.red.shade100
                                          : exrList.contains(
                                                      exerciseData[index]) &&
                                                  exerciseData[index].mark == 3
                                              ? Colors.orange
                                              : Colors.orange.shade100),
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(exerciseData[index]
                                  .question!
                                  .quesKey
                                  .toString()),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(exerciseData[index]
                                                  .question
                                                  .quesValue
                                                  .toString()),
                                            ),
                                            Text(
                                                "(${exerciseData[index].mark})")
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(
                          //   height: 5.0,
                          // ),
                          // Wrap(
                          //   spacing: 8.0, // gap between adjacent chips
                          //   runSpacing: 4.0, // gap between lines
                          //   // direction: Axis.horizontal,
                          //   crossAxisAlignment: WrapCrossAlignment.center,
                          //   children: [
                          //     ...?exerciseData[index]
                          //         .options
                          //         ?.map((OptionModel e) => Row(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: [
                          //                 Text(e.ansKey.toString()),
                          //                 const SizedBox(
                          //                   width: 5.0,
                          //                 ),
                          //                 Text(e.ansValue.toString()),
                          //               ],
                          //             ))
                          //         .toList()
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: exrList.isEmpty
              ? null
              : () async {
                  debugPrint("asdjknd");
                  await EasyLoading.show(
                    status: 'loading...',
                    maskType: EasyLoadingMaskType.black,
                  );
                  final pdfFile =
                      await PdfGenerator.generateExercisePdf(exrList);
                  EasyLoading.dismiss();
                  PdfApi.openFile(pdfFile);
                  setState(() {
                    exrList = [];
                  });
                },
          label: const Text("Generate PDF")),
    );
  }
}
