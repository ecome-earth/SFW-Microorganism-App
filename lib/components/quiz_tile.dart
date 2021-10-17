import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfw_microorganisms/providers/quiz_provider.dart';
import 'package:sfw_microorganisms/styles/text_styles.dart';

class QuizTile extends StatelessWidget {
  const QuizTile({Key? key, this.text}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, provider, _) {
        return GestureDetector(
          onTap: () {
            print('hi');
            provider.selectItem(choice: text!);
            provider.setPreviousIndex(choice: text!);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: provider.testQuiz!.choices![text!]!
                          ? Colors.green
                          : Colors.black,
                      width: provider.testQuiz!.choices![text!]! ? 3.0 : 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    text!,
                    style: provider.testQuiz!.choices![text!]!
                        ? tabHeading
                        : headingNoBold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
