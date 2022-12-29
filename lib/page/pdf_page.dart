import 'package:flutter/material.dart';

import '../api/pdf_api.dart';
import '../api/pdf_paragraph_api.dart';
import '../widget/button_widget.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Question Generator"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonWidget(
                  text: 'Simple PDF',
                  onClicked: () async {
                    final pdfFile =
                        await PdfApi.generateCenteredText('Sample Text');

                    PdfApi.openFile(pdfFile);
                  },
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Paragraphs PDF',
                  onClicked: () async {
                    final pdfFile = await PdfParagraphApi.generate();

                    PdfApi.openFile(pdfFile);
                  },
                ),
                // const TeXView(
                //   child: TeXViewColumn(children: [
                //     TeXViewInkWell(
                //       id: "id_0",
                //       child: TeXViewColumn(children: [
                //         TeXViewDocument(r"""<h2>Flutter \( \rm\\TeX \)</h2>""",
                //             style: TeXViewStyle(
                //                 textAlign: TeXViewTextAlign.center)),
                //         TeXViewContainer(
                //           child: TeXViewImage.network(
                //               'https://raw.githubusercontent.com/shah-xad/flutter_tex/master/example/assets/flutter_tex_banner.png'),
                //           style: TeXViewStyle(
                //             margin: TeXViewMargin.all(10),
                //             borderRadius: TeXViewBorderRadius.all(20),
                //           ),
                //         ),
                //         TeXViewDocument(r"""<p>
                //        When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
                //        $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$</p>""",
                //             style: TeXViewStyle.fromCSS(
                //                 'padding: 15px; color: white; background: green'))
                //       ]),
                //     )
                //   ]),
                //   style: TeXViewStyle(
                //     elevation: 10,
                //     borderRadius: TeXViewBorderRadius.all(25),
                //     border: TeXViewBorder.all(TeXViewBorderDecoration(
                //         borderColor: Colors.blue,
                //         borderStyle: TeXViewBorderStyle.solid,
                //         borderWidth: 5)),
                //     backgroundColor: Colors.white,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
}
