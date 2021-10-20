import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

bool isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

loginOrRegister(String email, String pass, BuildContext context) async {
  final emailExists = SnackBar(content: Text('Wrong Password!'));

  final wrongEmail = SnackBar(
    content: Text('Email invalid'),
  );

  if (isValidEmail(email) != true) {
    ScaffoldMessenger.of(context).showSnackBar(wrongEmail);
    return null;
  }

  ParseUser user = ParseUser(email, pass, email);
  var response = await user.login();
  if (response.success) {
    print('Login Successful, redirecting to Root Page');

    ParseUser? currentUser = await ParseUser.currentUser();
    String? info = currentUser!.get('country');
    print(info);
    if (info == null || info == '') {
      Navigator.pushReplacementNamed(context, 'welcome');
    } else {
      Navigator.pushReplacementNamed(context, 'root');
    }
    return null;
  } else {
    print('Something is wrong Here...');
    if (response.error!.message == 'Invalid username/password.') {
      print(response.error!.message);

      user = ParseUser.createUser(email, pass, email);

      response = await user.signUp();

      if (response.success) {
        print('User created Succefully');
        Navigator.of(context).pushReplacementNamed('welcome');
        return null;
      } else {
        print('Something went wrong ...\n');
        if (response.error!.message ==
            'Account already exists for this username.') {
          ScaffoldMessenger.of(context).showSnackBar(emailExists);
          return null;
        }
      }
    }
  }
}

logout(BuildContext context) async {
  print('But Logging out for now...');
  final user = await ParseUser.currentUser() as ParseUser;
  var response = await user.logout();

  if (response.success) {
    print("User successfully logged out!");
    Navigator.of(context).pushReplacementNamed('auth');
  } else {
    print(response.error!.message);
  }
}

Future<String> getUserID() async {
  ParseUser? user = await getUser();
  String id = user!.get('objectId');
  return id;
}

Future<ParseUser?> getUser() async {
  ParseUser? currentUser = await ParseUser.currentUser();
  return currentUser;
}
