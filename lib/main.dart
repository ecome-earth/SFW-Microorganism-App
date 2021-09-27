import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfw_microorganisms/providers/bottomnavbar_provider.dart';
import 'package:sfw_microorganisms/providers/profile_provider.dart';
import 'package:sfw_microorganisms/providers/quiz_provider.dart';
import 'package:sfw_microorganisms/screens/Gallery.dart';
import 'package:sfw_microorganisms/screens/ProfileInfo.dart';
import 'package:sfw_microorganisms/screens/ProfileUploadNew.dart';
import 'package:sfw_microorganisms/screens/root_screen.dart';
import 'package:sfw_microorganisms/screens/quiz/answer_selected_screen.dart';

import 'screens/root_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ProfileProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (context) => QuizProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (context) => BottomNavBarProvider(), lazy: false),
      ],
      child: ChangeNotifierProvider(
        create: (context) => ProfileProvider(),
        child: MaterialApp(
            title: 'SFW Microorganisms',
            debugShowCheckedModeBanner: false,
            routes: {
              'quiz': (context) => AnswerSelectedScreen(),
              'gallery': (context) => Gallery(),
              'newUpload': (context) => UploadForm(),
              'root': (context) => ProfileUploads(),
              'info': (context) => ProfileInfo(),
            },
            theme: ThemeData(
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
                      child: Stack(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                bottom: 20.0,
                              ),
                              child: Center(
                                child: Text('Problem with firebase ...'),
                              )),
                        ],
                      ),
                    ),
                  );
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
                        // MaterialPageRoute(builder: (context) => AuthScreen()),
                        MaterialPageRoute(
                            builder: (context) => ProfileUploads()),
                      );
                    }
                    // else {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => ProfileInfo()),
                    //   );
                    // }
                  });

                  return ProfileUploads();
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
            ),
      ),
    );
  }
}
