import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sfw_microorganisms/classes/Profile.dart';

import 'screens/AuthScreen.dart';
import 'screens/ProfileScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SFW Microorganisms',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xffEEEEEE),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            hintStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          fontFamily: GoogleFonts.roboto().fontFamily,
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          // Initialize FlutterFire
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            // Check for errors

            if (snapshot.hasError) {
              print('problem occured with Firebase');

              // TODO: RETURN ERROR SCREEN INSTEAD OFF AuthScreen
              return Scaffold(
                  backgroundColor: Colors.grey[100],
                  body: SafeArea(
                      child: Stack(children: [
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 20.0,
                        ),
                        child: Center(
                          child: Text('Problem with firebase ...'),
                        )),
                  ])));
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              // ADD LISTENER TO KNOW IF USER IS NOT LOGGED IN TO SIGNIN
              print('All good and connected to firebase');
              FirebaseAuth.instance.authStateChanges().listen((User? user) {
                if (user == null) {
                  // redirect to Login page if not logged in
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthScreen()),
                  );
                }
                // else {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => ProfileScreen()),
                //   );
                // }
              });

              return ProfileScreen();
            }

            // Otherwise, show something LOADING waiting for initialization to complete
            return Scaffold(
                backgroundColor: Colors.grey[100],
                body: SafeArea(
                    child: Stack(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        bottom: 20.0,
                      ),
                      child: Center(
                        child: Text('Loading ...'),
                      )),
                ])));

            // childAuthScreen();
          },
        )

        //MyHomePage(title: 'SFW Microorganisms'),
        );
  }
}
