import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:sfw_microorganisms/classes/Profile.dart';
import 'package:sfw_microorganisms/screens/ProfileInfo.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreen createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  bool showpassword = false;

  var auth;
  var userStore;
  var profile;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    userStore = FirebaseFirestore.instance.collection('users');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void showMessage(String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void continueToProfileInfo() {
    Route route = MaterialPageRoute(builder: (context) => ProfileInfo());
    Navigator.pushReplacement(context, route);
  }

  Future<void> resetPassword() async {
    if (isValidEmail(email.text)) {
      try {
        await auth.sendPasswordResetEmail(email: email.text);
        showMessage('We send you reset email');
      } catch (e) {
        print(e);
        showMessage("Couldn't connect to server");
      }
    } else {
      showMessage('Enter a valid email first');
    }
  }

  Future<void> getProfileAndContinueToProfileInfo() async {
    Profile? userProfile = await Profile.getByEmail(email.text);

    if (userProfile is Profile) {
      print('page navigation complete');
      continueToProfileInfo();
    } else {
      showMessage('Error occured gathering your profile');
      print('No profile gathered');
    }
  }

  Future<void> createUserProfile(String email) async {
    // CREATE USER PROFILE
    Profile profile = new Profile();
    profile.name = 'Anonymous';
    profile.email = email;

    await Profile.add(profile.toJson());
  }

  Future<void> registerWithEmail() async {
    try {
      print('CALLED REGISTER FUNCTION');

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      print('USER CREATED');

      await createUserProfile(email.text);
      getProfileAndContinueToProfileInfo();

      // SEND VERIFICATION EMAIL WHEN ALL IS COMPLETE
      // await sendVerificationEmail();

      // print('EMAIL VERIFICATION SENT');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        showMessage('The password provided is too§ weak.');
      }
      // else if (e.code == 'email-already-in-use') {
      //
      //   print('The account already exists logging in.');
      //   await login();
      //
      //
      // }
      else {
        print('error occured $e');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> continueWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential credentials =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User? user = credentials.user;

    // Create new profile if user profile exist
    if (user != null) {
      Profile? userProfile = await Profile.getByEmail(user.uid);
    } else {
      await createUserProfile(email.text);
    }

    continueToProfileInfo();
  }

  Future<void> continueAnonymous() async {
    await FirebaseAuth.instance.signInAnonymously();
    createUserProfile(auth.currentUser.uid);
    continueToProfileInfo();
  }

  Future<void> loginOrRegister() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      // GET PPROFILE AND REDIRECT TO PROFILE PAGE
      getProfileAndContinueToProfileInfo();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        registerWithEmail();
      } else if (e.code == 'wrong-password') {
        showMessage('Invalid password');
        print('Wrong password provided for that user.');
      }
    }
  }

  Future sendVerificationEmail() async {
    User? user = auth.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      showMessage('Verfifcation Email Sent');
    }
  }

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void signout() {
    auth.signOut();
  }

  Future<void> handleSubmit() async {
    // LOGIN
    // IF USER DOESN'T EXIST THEN CREATE PROFILE AND REGISTER
    // ELSE GET PROFILE AND SHOW PROFILE SCREEN

    final FormState form = _formKey.currentState as FormState;
    if (form.validate()) {
      await loginOrRegister();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Image.asset('assets/images/logo.png', height: 200),
                    const Spacer(),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        hintText: 'Username / Email',
                      ),
                      validator: (String? value) {
                        if (value != null && isValidEmail(value)) {
                          return null;
                        } else {
                          return "Invalid Email";
                        }
                      },
                      cursorColor: Colors.black,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    TextFormField(
                      obscureText: !showpassword,
                      controller: password,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () => setState(() {
                            showpassword = !showpassword;
                          }),
                          icon: showpassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null) return "You must enter a password";

                        bool atLeastEightChars =
                            RegExp(r'.{8,}').hasMatch(value);
                        if (!atLeastEightChars)
                          return "Enter at least 8 characters";

                        return null;
                        // TO ADD STRONG PASSWORD USE THE FOLLOWING REGEXP
                        // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)
                      },
                      cursorColor: Colors.black,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.grey[800],
                            textStyle: const TextStyle(fontSize: 10),
                          ),
                          onPressed: resetPassword,
                          child: Text(
                            'forgot password?',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xff03DAC5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: handleSubmit,
                        child: const Text(
                          'Login / Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 200,
                      child: SignInButton(
                        Buttons.Google,
                        text: "Continue with Google",
                        onPressed: continueWithGoogle,
                      ),
                    ),
                    const Spacer(),
                    // Row(
                    //   children: [
                    //     TextButton(
                    //       style: TextButton.styleFrom(
                    //         padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    //         primary: Colors.grey[600],
                    //         textStyle: const TextStyle(fontSize: 10),
                    //       ),
                    //       onPressed: continueAnonymous,
                    //       child: const Text(
                    //         'skip login',
                    //         style: TextStyle(fontSize: 14),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
