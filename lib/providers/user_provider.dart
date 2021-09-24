import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfw_microorganisms/models/upload.dart';
import 'package:sfw_microorganisms/models/user.dart';
import 'package:sfw_microorganisms/models/vote.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  void changeName({required String newName}) {
    _user!.nickname = newName;
    notifyListeners();
  }

  void changeLocation({required String newLocation}) {
    _user!.location = newLocation;
    notifyListeners();
  }

  void updateExperience({required String newExperience}) {
    _user!.experience = newExperience;
    notifyListeners();
  }

  void updateEmail({required String newEmail, required BuildContext context}) {
    _checkEmail(email: newEmail)
        ? _user!.email = newEmail
        : _user!.email = _user!.email;

    _user!.email == _user!.email
        ? ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Email not updated')))
        : ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Email updated')));

    notifyListeners();
  }

  bool _checkEmail({required String email}) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void updateVote({required Vote vote}) {
    _user!.votes.add(vote);
    notifyListeners();
  }

  void deleteVote({required String id}) {
    _user!.votes.removeWhere((element) => element.voteId == id);
    notifyListeners();
  }

  void updateUpload({required Upload upload}) {
    _user!.uploads!.add(upload);
  }

  void deleteUpload({required String id}) {
    _user!.uploads!.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
