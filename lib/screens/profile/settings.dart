import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:google_fonts/google_fonts.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  bool anonymous = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,appBar: AppBar(backgroundColor: Colors.white,elevation: 0,),body: Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),color: Colors.white,child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text('DONATE',style: GoogleFonts.permanentMarker(color: Colors.black,fontSize: 24),),
        Padding(padding: EdgeInsets.only(top: 20),child: Text('99% Transparent (in progress)',style: GoogleFonts.roboto(fontSize: 16),),),
        Padding(padding: EdgeInsets.only(top: 20),child: Text("We are an open source project for the Soil Food Web Community. (Github link)\n\nWe are working on a 99% transparent donation system. You can read about it here.\n\nAt the meantime we accept donation via my Paypal account. I will put all the received donations in here so everyone can see who donated what. If you want to stay anonymous please click the box.\n\nThank you very much for your support!",style: GoogleFonts.roboto(fontSize: 14),),)
,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Checkbox(value: anonymous, onChanged: (value){
            setState(() {
              anonymous=value!;
            });
          }), Text('Stay anonymous'),
        ],),
        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Color.fromARGB(255, 159, 101, 35)),child: TextButton(onPressed: (){}, child: Text('Donate via PayPal',style:  GoogleFonts.roboto(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500),)))
      ,Padding(
        padding: const EdgeInsets.only(top:28.0),
        child: Row(children: [
          Text('20\$',style: GoogleFonts.roboto(fontSize: 16,color: Color.fromARGB(255, 0, 224, 157)),),
            Spacer(),
            Text('15.08.21',style: GoogleFonts.roboto(fontSize: 12),)
        ],),
      ),

        Padding(
          padding: const EdgeInsets.only(top:18.0),
          child: Row(
            children: [
              Text('Thank you “Name” for your Donation!',style: GoogleFonts.roboto(fontSize: 14),),
            ],
          ),
        )
      ],
    ),));
  }
}


class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  _SecurityPageState createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class ChangeInfo extends StatefulWidget {
  const ChangeInfo({Key? key}) : super(key: key);

  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
