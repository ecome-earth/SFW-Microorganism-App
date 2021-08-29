import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreen createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {

  final email = TextEditingController();
  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var auth;


  @override
  @mustCallSuper
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void isSignedIn() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future register (String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future login (String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future sendVerificationEmail () async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user!= null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  void signout()  {
    FirebaseAuth.instance.signOut();
  }

  void handleSubmit() {
    final FormState form = _formKey.currentState as FormState;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
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
              child: Center(
                child: Container(
                  width: 230,
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
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,  
                                fontSize: 20,
                                
                              ),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            //   child: Text('Invalid Email Address',
                            //     style: TextStyle(
                            //       color: Colors.red
                            //     ),
                            //   ),
                            // ),
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
                                          labelText: 'Email',
                                          hintText: 'Enter your email',
                                        ),
                                        validator: (String? value) {
                                          if(
                                            value != null &&
                                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)
                                          ) {
                                            return null;
                                          } else {
                                            return "Invalid Email";
                                          }
                                        },
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        controller: password,
                                        decoration: const InputDecoration(
                                          labelText: 'Password',
                                          hintText: 'Enter your password',
                                        ),
                                        validator: (String? value) {

                                          if (value == null) return "You must enter a password";

                                          bool atLeastEightChars = RegExp(r'.{8,}').hasMatch(value);
                                          if (!atLeastEightChars) return "Enter at least 8 characters";

                                          return null;

                                          // TO ADD STRONG PASSWORD USE THE FOLLOWING REGEXP
                                          // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)

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
                              onPressed: handleSubmit,
                              //   () {
                              //
                              //
                              //   // make sure all is vaild
                              //   // submit the form
                              //   // call firebase functions
                              //
                              //
                              //
                              //   print('form submitted');
                              //
                              //
                              //   //validate password
                              //   // var userPassword = password.text;
                              //   // print(password.text);
                              //
                              //
                              // },
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
                            Row(
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.grey[800],
                                    textStyle: const TextStyle(fontSize: 10),
                                  ),
                                  onPressed: () {},
                                  child: Text('forgot password?',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                                    primary: Colors.grey[600],
                                    textStyle: const TextStyle(fontSize: 10),
                                  ),
                                  onPressed: () {},
                                  child: const Text('skip login',
                                      style: TextStyle(
                                        fontSize: 14
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            // TextButton(
                            //   style: TextButton.styleFrom(
                            //     padding: const EdgeInsets.all(16.0),
                            //     primary: Colors.grey[800],
                            //     textStyle: const TextStyle(fontSize: 12),
                            //   ),
                            //   onPressed: () {},
                            //   child: const Text('skip login',
                            //       style: TextStyle(fontSize: 14),
                            //     ),
                            //   ),
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
              ),
            ),
            // CustomBackButton(),
          ],
        ),
      ),
    );
  }
}
