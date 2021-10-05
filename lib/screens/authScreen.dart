import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:sfw_microorganisms/screens/profile/profileInfo.dart';
import 'package:sfw_microorganisms/services/authentication_service.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreen createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  bool showpassword = false;

  var profile;

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
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
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
                      keyboardType: TextInputType.visiblePassword,
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
                          onPressed: null,
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
                        onPressed: () {
                          loginOrRegister(
                              email.text.trim(), password.text.trim(), context);
                        },
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











































