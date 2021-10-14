import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sfw_microorganisms/providers/profile_provider.dart';

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
    return FloatingNavbar(
      backgroundColor: Color(0xFF5C3D2E),
      selectedBackgroundColor: Color(0xFFFAEBE0),
      selectedItemColor: Color(0xFF5C3D2E),
      unselectedItemColor: Color(0xFFFAEBE0),
      currentIndex: widget.index,
      onTap: (index) {
        setState(() => widget.index = index);
        debugPrint('the nav items: ${widget.provider.bottomNavItems}');
        widget.provider.selectItem(index: index);
        widget.provider.setPreviousIndex(index: index);
      },
      items: [
        FloatingNavbarItem(
          customWidget: InkWell(
            onTap: () {
              print('Navigating to profile info screen');
              Navigator.of(context).pushNamed('root');
              setState(() {
                widget.index = 0;
                widget.provider.bottomNavItems![0] = true;
                widget.provider.bottomNavItems![1] = false;
                widget.provider.bottomNavItems![2] = false;
              });
            },
            child: Icon(
              Icons.person,
              size: 40,
              color: widget.provider.bottomNavItems![0]!
                  ? Color(0xFF5C3D2E)
                  : Color(0xFFFAEBE0),
            ),
          ),
          title: 'Profile',
        ),
        FloatingNavbarItem(
          customWidget: InkWell(
            onTap: () {
              print('Navigating to quiz screen');
              Navigator.of(context).pushNamed('quiz');
              setState(() {
                widget.index = 1;
                widget.provider.bottomNavItems![0] = false;
                widget.provider.bottomNavItems![1] = true;
                widget.provider.bottomNavItems![2] = false;
              });
              // provider.bottomNavItems![0]!;
            },
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.quiz,
                  size: 35,
                  color: widget.provider.bottomNavItems![1]!
                      ? Color(0xFF5C3D2E)
                      : Color(0xFFFAEBE0),
                ),
                Text(
                  'Quiz',
                  style: TextStyle(
                    color: widget.provider.bottomNavItems![1]!
                        ? Color(0xFF5C3D2E)
                        : Color(0xFFFAEBE0),
                  ),
                ),
              ],
            ),
          ),
        ),
        FloatingNavbarItem(
          customWidget: InkWell(
            onTap: () {
              print('Navigating to gallery');
              Navigator.pushNamed(context, 'gallery');
              setState(() {
                widget.index = 2;
                widget.provider.bottomNavItems![0] = false;
                widget.provider.bottomNavItems![1] = false;
                widget.provider.bottomNavItems![2] = true;
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.style,
                  size: 35,
                  color: widget.provider.bottomNavItems![2]!
                      ? Color(0xFF5C3D2E)
                      : Color(0xFFFAEBE0),
                ),
                Text(
                  'Gallery',
                  style: TextStyle(
                    color: widget.provider.bottomNavItems![2]!
                        ? Color(0xFF5C3D2E)
                        : Color(0xFFFAEBE0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
