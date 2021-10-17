import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sfw_microorganisms/components/camera_component.dart';
import 'package:sfw_microorganisms/components/quiz_tile.dart';
import 'package:sfw_microorganisms/providers/quiz_provider.dart';
import 'package:sfw_microorganisms/styles/text_styles.dart';

class AnswerSelectedScreen extends StatelessWidget {
  const AnswerSelectedScreen({Key? key}) : super(key: key);
//TODO: add the Toast Package and Work with it to implement the Info Toast.
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
                      onPressed: () {

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InfoPopUp();
                            });
                      },
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
        ),
      );
    });
  }
}

class InfoPopUp extends StatelessWidget {
  const InfoPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( color: Colors.white,width: MediaQuery.of(context).size.width*0.8,
      height:MediaQuery.of(context).size.height*0.4,child: Column(children: [Row(crossAxisAlignment: CrossAxisAlignment.start,children: [Text('15.05.21',style: GoogleFonts.roboto(fontSize: 8),),],)],) ,);
  }
}

