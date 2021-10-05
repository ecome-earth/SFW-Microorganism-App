
class Profile {

    String docId = "";
    String name = "";
    String email = "";
    String googleDriveAccount = "";
    String profilePhoto = "";
    int level = 0;
    int points = 0;
    int xp = 0;






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