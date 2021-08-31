import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {

    String docId = "";
    String name = "";
    String email = "";
    String googleDriveAccount = "";
    String profilePhoto = "";
    int level = 0;
    int points = 0;
    int xp = 0;


    static Future<bool> add (data) async {
        bool complete = false;
        await FirebaseFirestore.instance.collection('users')
            .add(data)
            .then((value) => { complete = true })
            .catchError((error) => print("Failed to add user: $error"));

        return complete;
    }

    static Future<Profile?> getByEmail(String email) async {
      try {

        return await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .get()
            .then((QuerySnapshot result) async {

              if (result.docs.length > 0) {

                dynamic firstDocument = result.docs[0];
                Profile profile = Profile.fromJson(firstDocument);

                return profile;


              } else {

                return null;
              }

            });

      } catch (e) {

        print('couldnt get profile.');
        print(e);
        return null;

      }

    }

    Future<bool> save () async {
        bool complete = false;
        await FirebaseFirestore.instance.collection('users')
            .doc(docId)
            .update(this.toJson())
            .then((value) => complete = true)
            .catchError((error) => print("Failed to update user: $error"));

        return complete;
    }


    static Profile fromJson(dynamic json) {

      Profile profile = new Profile();
      // profile.docId = json['docId'] as String;
      profile.name = json['name'] as String;
      profile.email = json['email'] as String;
      profile.googleDriveAccount = json['googleDriveAccount'] as String;
      profile.profilePhoto = json['profilePhoto'] as String;
      profile.level = json['level'] as int;
      profile.points = json['points'] as int;
      profile.xp = json['xp'] as int;

      return profile;
    }


    Map<String, Object?> toJson() {
      return {
        "name": name,
        "email": email,
        "googleDriveAccount": googleDriveAccount,
        "level": level,
        "points": points,
        "xp": xp,
        "profilePhoto": profilePhoto
      };
    }







}