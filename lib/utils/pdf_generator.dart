import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../models/exercise_one_model.dart';

class PdfGenerator {
  static Future<File> generateExercisePdf(
      List<ExerciseOneModel> exerciseModel) async {
    List<List<OptionModel>> exListWithOpt = [];

    for (var element in exerciseModel) {
      List<OptionModel> optList = [];
      for (var option in element.options) {
        if (option.ansType == "image") {
          // var assetImg = MemoryImage(
          //   (await rootBundle.load(option.ansValue)).buffer.asUint8List(),
          // );

          // var assetImg = await rootBundle.loadString('assets/svg.svg');
          // var assetImg = await rootBundle.loadString(option.ansValue);
          optList.add(OptionModel(
              ansKey: option.ansKey,
              ansValue: option.ansValue,
              // ansValue: assetImg,
              ansType: option.ansType));
          // optList.add({"type": "image", "value": assetImg});
        } else {
          optList.add(OptionModel(
              ansKey: option.ansKey,
              ansValue: option.ansValue,
              ansType: option.ansType));
          // optList.add({"type": "text", "value": option.ansValue});
        }
      }
      exListWithOpt.add(optList);
    }

    final pdf = Document();

    final customFont =
        Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    pdf.addPage(
      MultiPage(
        margin: const EdgeInsets.all(20.0),
        build: (context) => <Widget>[
          // buildCustomHeader(),
          SizedBox(height: 0.5 * PdfPageFormat.cm),

          ...List.generate(
              exerciseModel.length,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${index + 1}.  ${exerciseModel[index].question.quesValue}",
                              style: TextStyle(
                                fontSize: 14,
                                font: customFont,
                              )),
                          SizedBox(height: 10.0),
                          Wrap(
                              spacing: 10.0, // gap between adjacent chips
                              runSpacing: 10.0, // gap between lines
                              // direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                ...List.generate(
                                    exListWithOpt[index].length,
                                    (optIndex) => Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(exListWithOpt[index]
                                                      [optIndex]
                                                  .ansKey),
                                              SizedBox(width: 5.0),
                                              exListWithOpt[index][optIndex]
                                                          .ansType ==
                                                      "image"
                                                  ? Center(
                                                      child: SvgImage(
                                                      svg: exListWithOpt[index]
                                                              [optIndex]
                                                          .ansValue,
                                                      width: 100,
                                                    ))

                                                  // ? Container(
                                                  //     // height: 50,
                                                  //     child: Image(
                                                  //         exListWithOpt[index]
                                                  //                 [optIndex]
                                                  //             .ansValue))
                                                  : Text(exListWithOpt[index]
                                                          [optIndex]
                                                      .ansValue
                                                      .toString()),
                                            ]))
                              ])
                        ]),
                  )),
        ],
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';

          return Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 1 * PdfPageFormat.cm),
            child: Text(
              text,
              style: TextStyle(color: PdfColors.black),
            ),
          );
        },
      ),
    );

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
