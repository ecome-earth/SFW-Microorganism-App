import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sfw_microorganisms/models/quiz.dart';
import 'package:sfw_microorganisms/providers/profile_provider.dart';
import 'package:sfw_microorganisms/screens/gallery.dart';
import 'package:sfw_microorganisms/screens/quiz/answer_selected_screen.dart';
import 'package:sfw_microorganisms/screens/root_screen.dart';

class CustomNavBar extends StatefulWidget {
  final ProfileProvider provider;
  var index;

  CustomNavBar({required this.provider, required this.index});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: widget.index,
      itemCornerRadius: 30,
      curve: Curves.bounceInOut,
      onItemSelected: (index) {
        setState(() => widget.index = index);
        debugPrint('the nav items: ${widget.provider.bottomNavItems}');

        switch (index) {
          case 0:
            print('Navigating to profile info screen');
            // Navigator.of(context).pushNamed('root');
            Navigator.push(
              context,
              PageTransition(
                child: ProfileUploads(),
                type: PageTransitionType.rightToLeftWithFade,
                duration: Duration(milliseconds: 300),
              ),
            );
            break;
          case 1:
            print('Navigating to quiz screen');
            // Navigator.of(context).pushNamed('quiz');
            Navigator.push(
              context,
              PageTransition(
                child: AnswerSelectedScreen(),
                type: PageTransitionType.rightToLeftWithFade,
                duration: Duration(milliseconds: 300),
              ),
            );
            break;
          case 2:
            print('Navigating to gallery');
            // Navigator.pushNamed(context, 'gallery');
            Navigator.push(
              context,
              PageTransition(
                child: Gallery(),
                type: PageTransitionType.rightToLeftWithFade,
                duration: Duration(milliseconds: 300),
              ),
            );
            break;
          default:
        }
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
          textAlign: TextAlign.center,
          activeColor: Colors.blue,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.quiz_rounded),
          title: Text('Quiz'),
          textAlign: TextAlign.center,
          activeColor: Colors.purple,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.photo_size_select_actual_outlined,
          ),
          title: Text('Microdex'),
          textAlign: TextAlign.center,
          activeColor: Colors.amber,
        ),
      ],
    );
  }
}
