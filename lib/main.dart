import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sfw_microorganisms/classes/Profile.dart';
import 'package:sfw_microorganisms/providers/profile_provider.dart';
import 'package:sfw_microorganisms/screens/ProfileUploads.dart';

import 'screens/AuthScreen.dart';
import 'screens/ProfileScreen.dart';
import 'screens/ProfileUploads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: MaterialApp(
          title: 'SFW Microorganisms',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
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
                      // MaterialPageRoute(builder: (context) => AuthScreen()),
                      MaterialPageRoute(builder: (context) => ProfileUploads()),
                    );
                  }
                  // else {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => ProfileScreen()),
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
    );
  }
}
