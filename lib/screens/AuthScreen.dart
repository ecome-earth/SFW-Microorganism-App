import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreen createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {

  final email = TextEditingController();
  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  @mustCallSuper
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body:
      SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 60.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        ),
                        SizedBox(height: 10),
                        Text('SFW Microorganisms',
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontWeight: FontWeight.bold,  fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Center(
                            child: Container(
                              width: 220,
                              child: Column(
                              children: <Widget>[
                                  // Add TextFormFields and ElevatedButton here.
                                  TextFormField(
                                    controller: email,
                                    decoration: const InputDecoration(
                                      hintText: 'Email',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    controller: password,
                                    decoration: const InputDecoration(
                                      hintText: 'Password',
                                    ),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            )
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 16),
                              minimumSize: Size(220, 34),
                          ),
                          onPressed: () {

                            // CHECK IF EMAIL IS REGISTERED THEN LOGIN
                            //    check email and password match
                            //      yes ? get user data and update in local DB
                            //      no ?
                            // ELSE REGISTER
                            print(email.text);
                            print(password.text);


                          },
                          child: const Text('Login / Register'),
                        ),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          indent: 40,
                          endIndent: 40,
                        ),
                        SignInButton(
                          Buttons.Google,
                          text: "Continue with Google",
                          onPressed: () {},
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.grey[800],
                            textStyle: const TextStyle(fontSize: 12),
                          ),
                          onPressed: () {},
                          child: const Text('skip login',
                              style: TextStyle(fontSize: 14),

                            ),
                          ),
                      ],
                    ),
                  ),
                  // FutureBuilder(
                  //   future:
                  //   GAuthentication.initializeFirebase(context: context),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasError) {
                  //       return Text('Error initializing Firebase');
                  //     } else if (snapshot.connectionState ==
                  //         ConnectionState.done) {
                  //       return GoogleSignInButton();
                  //     }
                  //     return CircularProgressIndicator(
                  //       valueColor: AlwaysStoppedAnimation<Color>(
                  //         Colors.orange[400],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
            // CustomBackButton(),
          ],
        ),
      ),
    );
  }
}
