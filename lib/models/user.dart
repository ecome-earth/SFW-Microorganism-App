// Location ( Optional ) Email address, and a nickname. Experience,
// and Tokens count. User should also have a list of Uploads. a list of Votes.

import 'upload.dart';
import 'vote.dart';

class User {
  String? location;
  String? email;
  String? nickname;
  String? experience;
  List<Upload>? uploads;
  List<Vote> votes;

  User(this.location, this.email, this.nickname, this.experience, this.uploads,
      this.votes);

  @override
  String toString() {
    // TODO: implement toString
    return '$nickname is from $location. Email is $email. Here is their experience: $experience.';
  }
}
