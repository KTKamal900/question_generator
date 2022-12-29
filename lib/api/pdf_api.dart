import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generateCenteredText(String text) async {
    var assetImage = MemoryImage(
      (await rootBundle.load('assets/equation (1).png')).buffer.asUint8List(),
    );
    final pdf = Document();

    pdf.addPage(Page(
      margin: const EdgeInsets.all(8.0),
      build: (context) => Center(
        child: Column(children: [
          Text(
              "(65)	Ô[ NaCl GF :Ol8SDF\ 10v4 mol % SrCl2 pD[ZJFDF\ VFJ[ TM pNŸEJTF VJSFXGL ;\bIF S[8,L YX[ m",
              style: const TextStyle(fontSize: 14)),
          SizedBox(height: 10.0),
          Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              // direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("(A)"),
                      SizedBox(width: 5.0),
                      Container(height: 15, child: Image(assetImage)),
                    ]),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Text("(B)"),
                  SizedBox(width: 5.0),
                  Container(height: 15, child: Image(assetImage)),
                ]),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Text("(C)"),
                  SizedBox(width: 5.0),
                  Container(height: 15, child: Image(assetImage)),
                ]),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Text("(D)"),
                  SizedBox(width: 5.0),
                  Container(height: 15, child: Image(assetImage)),
                ]),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Text("(D)"),
                  SizedBox(width: 5.0),
                  Container(height: 15, child: Image(assetImage)),
                ]),
              ])
        ]),
        // child: Text("6.02 × 1016 molv1", style: const TextStyle(fontSize: 48)),
      ),
    ));

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
