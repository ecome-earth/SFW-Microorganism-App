class Profile {

    String email = "";
    String googleDriveAccount = "";
    String profilePhoto = "";
    int level = 0;
    int points = 0;
    int xp = 0;


    Profile (data) {

        email = data.email;
        googleDriveAccount = data.googleDriveAccount;
        level =  data.level;
        points = data.points;
        xp = data.xp;
        profilePhoto = data.profilePhoto;

    }


}