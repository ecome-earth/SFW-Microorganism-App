import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sfw_microorganisms/services/authentication_service.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfo createState() => _ProfileInfo();
}

class _ProfileInfo extends State<ProfileInfo> {
  void showMessage(String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Container(
        color: Color(0xFFFFF7F4),
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 10),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.group,
                      size: 40,
                    ),
                    radius: 50,
                  ),
                ),
                Text(
                  'Username',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('Country, City', style: TextStyle(fontSize: 22)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('10', style: TextStyle(fontSize: 24)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.asset(
                        'assets/icons/worm.png',
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: MediaQuery.of(context).size.width * 0.2),
                  child: LinearProgressIndicator(),
                ),
                Text('200/500 XP',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.message_outlined)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.email_outlined)),
                  ],
                )
              ],
            ),
            Positioned(
              child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                      color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          'SETTINGS',
                                          style: GoogleFonts.luckiestGuy(
                                              fontSize: 36,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('donate');
                                      },
                                      child: Center(
                                        child: Text(
                                          'DONATE',
                                          style: GoogleFonts.permanentMarker(
                                              color: Colors.black,
                                              fontSize: 24),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('changeInfo');
                                      },
                                      child: Center(
                                        child: Text(
                                          'PROFILE',
                                          style: GoogleFonts.permanentMarker(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('security');
                                      },
                                      child: Center(
                                        child: Text(
                                          'SECURITY',
                                          style: GoogleFonts.permanentMarker(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: TextButton(
                                      onPressed: () {
                                        logout(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'LOGOUT',
                                          style: GoogleFonts.permanentMarker(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(
                                  flex: 4,
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  icon: Icon(Icons.settings)),
              top: 10,
              right: 10,
            )
          ],
        ),
      )),
    );
  }
}
