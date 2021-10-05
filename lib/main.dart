import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfw_microorganisms/providers/bottomnavbar_provider.dart';
import 'package:sfw_microorganisms/providers/profile_provider.dart';
import 'package:sfw_microorganisms/providers/quiz_provider.dart';
import 'package:sfw_microorganisms/screens/authScreen.dart';
import 'package:sfw_microorganisms/screens/gallery.dart';
import 'package:sfw_microorganisms/screens/profile/profileInfo.dart';
import 'package:sfw_microorganisms/screens/profile/uploadNew.dart';
import 'package:sfw_microorganisms/screens/profile/settings.dart';
import 'package:sfw_microorganisms/screens/root_screen.dart';
import 'package:sfw_microorganisms/screens/quiz/answer_selected_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'screens/root_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'gfy4voXwtd1HRxLS8Ye2cKrnnipWDl0mcwOkAMFt';
  final keyClientKey = 'sYJfx9d1B1kLhXsFZ6tQVz0hzKTZtkYRIdPocW4E';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  Parse parse = await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);
  var firstObject = ParseObject('FirstClass')
    ..set(
        'message', 'Hey ! First message from Flutter. Parse is now connected');
  await firstObject.save();

  print('done');
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
            'donate': (context) => DonatePage(),
            'security': (context) => SecurityPage(),
            'changeInfo': (context) => ChangeInfo(),
            'quiz': (context) => AnswerSelectedScreen(),
            'gallery': (context) => Gallery(),
            'newUpload': (context) => UploadForm(),
            'root': (context) => ProfileUploads(),
            'info': (context) => ProfileInfo(),
            'auth': (context) => AuthScreen(),
          },

          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: FutureBuilder(
            // Initialize Parse
            future: hasUserLogged(),
            builder: (context, snapshot) {
              // Check for errors

              if (snapshot.data == false) {
                print('problem occured with Back4App');
                print('No User Session Detected Redirecting to Auth Screen');

                return AuthScreen();
              } else {
                print('User Session Detected, Lets Navigate to root page ');

                return ProfileUploads();
              }

              // childAuthScreen();
            },
          ),

          //MyHomePage(title: 'SFW Microorganisms'),
        ),
      ),
    );
  }
}

Future<bool> hasUserLogged() async {
  ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
  if (currentUser == null) {
    return false;
  }
  //Checks whether the user's session token is valid
  final ParseResponse? parseResponse =
      await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);

  if (parseResponse?.success == null || !parseResponse!.success) {
    //Invalid session. Logout
    await currentUser.logout();
    return false;
  } else {
    return true;
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Text('Problem with Back4App ...'),
              )),
        ])));
  }
}

Future<ParseUser?> getUser() async {
  ParseUser? currentUser = await ParseUser.currentUser();
  return currentUser;
}
