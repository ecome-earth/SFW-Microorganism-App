import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:sfw_microorganisms/services/authentication_service.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController nameController = TextEditingController(text: 'NAME');
  TextEditingController countryController =
      TextEditingController(text: 'COUNTRY');
  TextEditingController cityController = TextEditingController(text: 'CITY');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'welcome',
                    style: GoogleFonts.luckiestGuy(
                        fontSize: 48,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        height: 72,
                        letterSpacing: -0.5),
                  ),
                ),
              ),
        Flexible(
        child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.image),
                radius: 48,
              ),),
        Flexible(
        child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 80,
                child: TextFormField(
                    controller: nameController,
                    style: GoogleFonts.permanentMarker(
                        fontSize: 24, fontWeight: FontWeight.w400)),
              ),),
        Flexible(
        child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 80,
                  child: TextFormField(
                    controller: countryController,
                    style: GoogleFonts.permanentMarker(
                        fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ),
              ),),
        Flexible(
        child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 80,
                child: TextFormField(
                    controller: cityController,
                    style: GoogleFonts.permanentMarker(
                        fontSize: 24, fontWeight: FontWeight.w400)),
              ),),
        Flexible(
        child: Container(
                height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 150, 123, 84),
                      borderRadius: BorderRadius.circular(8)),
                  child: ElevatedButton(
                      onPressed: () async {
                        ParseUser? user = await getUser();
                        user!.set('country', countryController.text.trim());
                        user.set('city', cityController.text.trim());
                        ParseResponse reponse = await user.save();
                        if (reponse.success) {
                          print('Saved New Infos');
                          Navigator.pushReplacementNamed(context, 'root');
                        } else {
                          print('something wrong happened, could\'nt upload new photo');
                          print(reponse.error!.message);
                        }
                      },
                      child: Text(
                        'DONE',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ))),),
            ],
          ),
        ),
      ),
    );
  }
}
