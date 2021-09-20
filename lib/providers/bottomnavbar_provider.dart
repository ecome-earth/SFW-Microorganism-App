import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfw_microorganisms/screens/profile/upload_screen.dart';
import 'package:sfw_microorganisms/screens/quiz/answer_selected_screen.dart';

class BottomNavBarProvider extends ChangeNotifier {
  final _pages = [
    UploadScreen(),
    AnswerSelectedScreen(),
    Container(
      color: Colors.red,
    ),
  ];

  dynamic get pages => _pages;
}
