import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../models/exercise_model.dart';

class PdfGenerator {
  static Future<File> generateExercisePdf(
      List<ExerciseModel> exerciseModel) async {
    List<List<OptionModel>> exListWithOpt = [];
    // var assetImage = MemoryImage(
    //   (await rootBundle.load('assets/equation (1).png')).buffer.asUint8List(),
    // );

    for (var element in exerciseModel) {
      List<OptionModel> optList = [];
      for (var option in element.options) {
        if (option.ansType == "image") {
          var assetImg = MemoryImage(
            (await rootBundle.load(option.ansValue)).buffer.asUint8List(),
          );
          optList.add(OptionModel(
              ansKey: option.ansKey,
              ansValue: assetImg,
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

          // Paragraph(
          //   text:
          //       'This is my custom font that displays also characters such as €, Ł, ...',
          //   style: TextStyle(font: customFont, fontSize: 20),
          // ),
          // buildCustomHeadline(),
          // buildLink(),
          // ...buildBulletPoints(),
          // Header(child: Text('My Headline')),
          // Paragraph(text: LoremText().paragraph(60)),
          // Paragraph(text: LoremText().paragraph(60)),
          // Paragraph(text: LoremText().paragraph(60)),
          // Paragraph(text: LoremText().paragraph(60)),
          // Paragraph(text: LoremText().paragraph(60)),

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
                                                  ? Container(
                                                      // height: 50,
                                                      child: Image(
                                                          exListWithOpt[index]
                                                                  [optIndex]
                                                              .ansValue))
                                                  : Text(exListWithOpt[index]
                                                          [optIndex]
                                                      .ansValue
                                                      .toString()),
                                            ]))

                                // Row(
                                //     mainAxisSize: MainAxisSize.min,
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     crossAxisAlignment:
                                //         CrossAxisAlignment.center,
                                //     children: [
                                //       Text("(A)"),
                                //       SizedBox(width: 5.0),
                                //       Container(
                                //           height: 15, child: Image(assetImage)),
                                //     ]),
                                // Row(mainAxisSize: MainAxisSize.min, children: [
                                //   Text("(B)"),
                                //   SizedBox(width: 5.0),
                                //   Container(
                                //       height: 15, child: Image(assetImage)),
                                // ]),
                                // Row(mainAxisSize: MainAxisSize.min, children: [
                                //   Text("(C)"),
                                //   SizedBox(width: 5.0),
                                //   Container(
                                //       height: 15, child: Image(assetImage)),
                                // ]),
                                // Row(mainAxisSize: MainAxisSize.min, children: [
                                //   Text("(D)"),
                                //   SizedBox(width: 5.0),
                                //   Container(
                                //       height: 15, child: Image(assetImage)),
                                // ]),
                                // Row(mainAxisSize: MainAxisSize.min, children: [
                                //   Text("(D)"),
                                //   SizedBox(width: 5.0),
                                //   Container(
                                //       height: 15, child: Image(assetImage)),
                                // ]),
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

    // pdf.addPage(Page(
    //     margin: const EdgeInsets.all(8.0),
    //     build: ListView(children: [
    //       ...List.generate(
    //           50,
    //           (index) => Padding(
    //                 padding: EdgeInsets.only(bottom: 10.0),
    //                 child: Column(children: [
    //                   Text(
    //                       "${index + 1}  (65)	Ô[ NaCl GF :Ol8SDF\ 10v4 mol % SrCl2 pD[ZJFDF\ VFJ[ TM pNŸEJTF VJSFXGL ;\bIF S[8,L YX[ m",
    //                       style: const TextStyle(fontSize: 14)),
    //                   SizedBox(height: 10.0),
    //                   Wrap(
    //                       spacing: 8.0, // gap between adjacent chips
    //                       runSpacing: 4.0, // gap between lines
    //                       // direction: Axis.horizontal,
    //                       crossAxisAlignment: WrapCrossAlignment.center,
    //                       children: [
    //                         Row(
    //                             mainAxisSize: MainAxisSize.min,
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             crossAxisAlignment: CrossAxisAlignment.center,
    //                             children: [
    //                               Text("(A)"),
    //                               SizedBox(width: 5.0),
    //                               Container(
    //                                   height: 15, child: Image(assetImage)),
    //                             ]),
    //                         Row(mainAxisSize: MainAxisSize.min, children: [
    //                           Text("(B)"),
    //                           SizedBox(width: 5.0),
    //                           Container(height: 15, child: Image(assetImage)),
    //                         ]),
    //                         Row(mainAxisSize: MainAxisSize.min, children: [
    //                           Text("(C)"),
    //                           SizedBox(width: 5.0),
    //                           Container(height: 15, child: Image(assetImage)),
    //                         ]),
    //                         Row(mainAxisSize: MainAxisSize.min, children: [
    //                           Text("(D)"),
    //                           SizedBox(width: 5.0),
    //                           Container(height: 15, child: Image(assetImage)),
    //                         ]),
    //                         Row(mainAxisSize: MainAxisSize.min, children: [
    //                           Text("(D)"),
    //                           SizedBox(width: 5.0),
    //                           Container(height: 15, child: Image(assetImage)),
    //                         ]),
    //                       ])
    //                 ]),
    //               )),
    //     ])
    //     // build: (context) => Column(children: [
    //     //   ...List.generate(
    //     //       50,
    //     //       (index) => Padding(
    //     //             padding: EdgeInsets.only(bottom: 10.0),
    //     //             child: Column(children: [
    //     //               Text(
    //     //                   "${index + 1}  (65)	Ô[ NaCl GF :Ol8SDF\ 10v4 mol % SrCl2 pD[ZJFDF\ VFJ[ TM pNŸEJTF VJSFXGL ;\bIF S[8,L YX[ m",
    //     //                   style: const TextStyle(fontSize: 14)),
    //     //               SizedBox(height: 10.0),
    //     //               Wrap(
    //     //                   spacing: 8.0, // gap between adjacent chips
    //     //                   runSpacing: 4.0, // gap between lines
    //     //                   // direction: Axis.horizontal,
    //     //                   crossAxisAlignment: WrapCrossAlignment.center,
    //     //                   children: [
    //     //                     Row(
    //     //                         mainAxisSize: MainAxisSize.min,
    //     //                         mainAxisAlignment: MainAxisAlignment.center,
    //     //                         crossAxisAlignment: CrossAxisAlignment.center,
    //     //                         children: [
    //     //                           Text("(A)"),
    //     //                           SizedBox(width: 5.0),
    //     //                           Container(height: 15, child: Image(assetImage)),
    //     //                         ]),
    //     //                     Row(mainAxisSize: MainAxisSize.min, children: [
    //     //                       Text("(B)"),
    //     //                       SizedBox(width: 5.0),
    //     //                       Container(height: 15, child: Image(assetImage)),
    //     //                     ]),
    //     //                     Row(mainAxisSize: MainAxisSize.min, children: [
    //     //                       Text("(C)"),
    //     //                       SizedBox(width: 5.0),
    //     //                       Container(height: 15, child: Image(assetImage)),
    //     //                     ]),
    //     //                     Row(mainAxisSize: MainAxisSize.min, children: [
    //     //                       Text("(D)"),
    //     //                       SizedBox(width: 5.0),
    //     //                       Container(height: 15, child: Image(assetImage)),
    //     //                     ]),
    //     //                     Row(mainAxisSize: MainAxisSize.min, children: [
    //     //                       Text("(D)"),
    //     //                       SizedBox(width: 5.0),
    //     //                       Container(height: 15, child: Image(assetImage)),
    //     //                     ]),
    //     //                   ])
    //     //             ]),
    //     //           ))
    //     // ]),
    //     ));

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
