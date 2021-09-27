import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CircleAvatar(child: Icon(Icons.add_a_photo_outlined),radius: 30,),
          TextFormField(),
          TextFormField(),
          TextFormField(),
          ElevatedButton(onPressed: (){}, child: Text('Submit'))
        ],
      ),
    );
  }
}




