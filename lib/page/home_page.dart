import 'package:flutter/material.dart';
import 'package:question_generator/data/books_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: booksData.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(booksData[index].title.toString()),
                            const SizedBox(
                              width: 5.0,
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
                  );
                }),
          ),
        ],
      ),
    );
  }
}
