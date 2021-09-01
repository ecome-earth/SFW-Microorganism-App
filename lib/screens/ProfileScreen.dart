import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {


  void showMessage (String text) {

    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_rounded),
            label: 'Upload',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.grey[800],
        onTap: (event) {},
      ),
      body:
      SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 0.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.attach_money)), //TextButton(onPressed: () {}, child: Text('Donate')),
                    IconButton(onPressed: () {}, icon: Icon(Icons.settings)), //TextButton(onPressed: () {}, child: Text('Donate')),
                    // TextButton(onPressed: () {}, child: Text('Settings'))
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text('Anonymous', style: TextStyle(fontSize: 20.0)),
              SizedBox(height: 20.0),
              CircleAvatar(
                backgroundColor: Colors.blue.shade800,
                radius: 50.0,
                child: const Text('AH'),
              ),
              SizedBox(height: 30.0),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 70.0, height: 30.0, child: Text('Level:', textAlign: TextAlign.right, style: TextStyle(fontSize: 18.0))),
                        SizedBox(width: 10.0),
                        SizedBox(width: 70.0, height: 30.0, child: Text('Value', style: TextStyle(fontSize: 18.0))),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 70.0, height: 30.0, child: Text('XP:', textAlign: TextAlign.right, style: TextStyle(fontSize: 18.0))),
                        SizedBox(width: 10.0),
                        SizedBox(width: 70.0, height: 30.0, child: Text('Value', style: TextStyle(fontSize: 18.0))),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 70.0, height: 30.0, child: Text('Points:', textAlign: TextAlign.right, style: TextStyle(fontSize: 18.0))),
                        SizedBox(width: 10.0),
                        SizedBox(width: 70.0, height: 30.0, child: Text('Value', style: TextStyle(fontSize: 18.0))),
                      ]
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () { },
                  child: Text('Connect your online drive')
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       FirebaseAuth.instance.signOut();
              //     },
              //     child: Text('Logout')
              // ),


            ],
          ),
        ),
      ),
    );
}
}
