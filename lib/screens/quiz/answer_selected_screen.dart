import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfw_microorganisms/components/bottom_navbar.dart';
import 'package:sfw_microorganisms/components/camera_component.dart';
import 'package:sfw_microorganisms/components/quiz_tile.dart';
import 'package:sfw_microorganisms/providers/profile_provider.dart';
import 'package:sfw_microorganisms/providers/quiz_provider.dart';
import 'package:sfw_microorganisms/styles/text_styles.dart';

class AnswerSelectedScreen extends StatefulWidget {

  AnswerSelectedScreen({Key? key}) : super(key: key);

  @override
  State<AnswerSelectedScreen> createState() => _AnswerSelectedScreenState();
}

class _AnswerSelectedScreenState extends State<AnswerSelectedScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(builder: (context, provider, _) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => debugPrint('coming soon'),
                        icon: Icon(Icons.style, size: 32.0),
                      ),
                      IconButton(
                        onPressed: () => debugPrint('coming soon'),
                        icon: Icon(Icons.info_outline_rounded, size: 32.0),
                      ),
                    ],
                  ),
                  ClipRect(
                    clipBehavior: Clip.hardEdge,
                    child: CameraComponent(
                      imgPath: provider.testQuiz!.imgPath,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 42.0),
                            child: Text(
                              'Back',
                              style: mediumText,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Other',
                            style: tabHeading,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: provider.testQuiz!.choices!.entries
                            .map((choice) => QuizTile(
                                  text: choice.key,
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  // for (var choice in provider.testQuiz!.choices!.entries)
                  //   QuizTile(
                  //     text: choice.key,
                  //   )
                ],
              ),
            ),
            bottomNavigationBar: CustomNavBar(provider: Provider.of<ProfileProvider>(context), index: 1),
          ),
        );
      });
  }
}
