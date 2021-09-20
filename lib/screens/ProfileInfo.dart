import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfo createState() => _ProfileInfo();
}

class _ProfileInfo extends State<ProfileInfo> {
  void showMessage(String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Container(
        color: Color(0xFFFFF7F4),
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0,bottom: 10),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.group,
                      size: 40,
                    ),
                    radius: 50,
                  ),
                ),
                Text('Username',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600),),
                Padding(
                  padding:  EdgeInsets.only(top:8.0),
                  child: Text('Country, City',style: TextStyle(fontSize: 22)),

                ),
                Row( mainAxisAlignment: MainAxisAlignment.center,children: [
                  Image.asset('assets/images/animal1.png',width: MediaQuery.of(context).size.width/6,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text('0/10',style: TextStyle(fontSize: 24)),
                  ),
               Image.asset('assets/images/animal2.png',width: MediaQuery.of(context).size.width/6,),

                ],),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:15,horizontal: MediaQuery.of(context).size.width*0.2),
                  child: LinearProgressIndicator(),
                ),
                Text('200/500 XP',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                Spacer(),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.facebook)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.email_outlined)),
                  ],)
              ],
            ),
            Positioned(
              child: IconButton(
                  onPressed: () {
                    print('Navigate to Payment');
                  },
                  icon: Icon(Icons.attach_money)),
              top: 10,
              left: 10,
            ),
            Positioned(
              child: IconButton(
                  onPressed: () {
                    print('Navigate to settings');
                  },
                  icon: Icon(Icons.settings)),
              top: 10,
              right: 10,
            )
          ],
        ),
      )),
    );
  }
}
