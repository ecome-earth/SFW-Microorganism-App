import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 36,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'DONATE',
                style: GoogleFonts.permanentMarker(
                    color: Colors.black, fontSize: 24),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  '99% Transparent (in progress)',
                  style: GoogleFonts.roboto(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "We are an open source project for the Soil Food Web Community. (Github link)\n\n"
                  "We are working on a 99% transparent donation system. You can read about it here.\n\n"
                  "At the meantime we accept donation via my Paypal account."
                  " I will put all the received donations in here so everyone can see who donated what. "
                  "If you want to stay anonymous please click the box.\n\nThank you very much for your support!",
                  style: GoogleFonts.roboto(fontSize: 14),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: anonymous,
                      onChanged: (value) {
                        setState(() {
                          anonymous = value!;
                        });
                      }),
                  Text('Stay anonymous'),
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 159, 101, 35)),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Donate via PayPal',
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ))),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: [
                    Text(
                      '20\$',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 224, 157)),
                    ),
                    Spacer(),
                    Text(
                      '15.08.21',
                      style: GoogleFonts.roboto(fontSize: 12),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    Text(
                      'Thank you “Name” for your Donation!',
                      style: GoogleFonts.roboto(fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  _SecurityPageState createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  TextEditingController password = TextEditingController(text: 'NEW PASSWORD');
  TextEditingController confirmPassword =
      TextEditingController(text: 'CONFIRM PASSWORD');
  bool obscurePassword = false;
  bool obscureConfirm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 36,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SECURITY',
              style: GoogleFonts.permanentMarker(
                  color: Colors.black, fontSize: 36),
            ),
            Container(
              margin:
                  EdgeInsets.only(left: 25, right: 25, top: 100, bottom: 25),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
                showCursor: false,
                obscureText: obscurePassword,
                textAlign: TextAlign.center,
                style: GoogleFonts.permanentMarker(
                    color: Colors.black, fontSize: 24),
                controller: password,
                onTap: () {
                  setState(
                    () {
                      password.text = '';
                      obscurePassword = true;
                    },
                  );
                },
                onChanged: (value) {
                  setState(() {
                    password.text = value;
                  });
                },
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 150, 123, 84),
                      blurRadius: 3,
                      spreadRadius: 5,
                      offset: Offset(0, 3))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
                showCursor: false,
                obscureText: obscureConfirm,
                textAlign: TextAlign.center,
                style: GoogleFonts.permanentMarker(
                    color: Colors.black, fontSize: 24),
                controller: confirmPassword,
                onTap: () {
                  setState(
                    () {
                      confirmPassword.text = '';
                      obscureConfirm = true;
                    },
                  );
                },
                onChanged: (value) {
                  setState(() {
                    confirmPassword.text = value;
                  });
                },
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 150, 123, 84),
                      blurRadius: 3,
                      spreadRadius: 5,
                      offset: Offset(0, 3))
                ],
              ),
            ),
            Container(
              width: 120,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black, blurRadius: 5, spreadRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 150, 123, 84)),
              child: TextButton(
                child: Text(
                  'DONE',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                onPressed: () {
                  if (password.text.trim() == 'NEW PASSWORD') {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please Type a Password')));
                  } else if (password.text.trim() !=
                      confirmPassword.text.trim()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Passwords do not match')));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChangeInfo extends StatefulWidget {
  const ChangeInfo({Key? key}) : super(key: key);

  @override
  _ChangeInfoState createState() => _ChangeInfoState();
}

class _ChangeInfoState extends State<ChangeInfo> {
  TextEditingController name = TextEditingController(text: 'NAME');
  TextEditingController country = TextEditingController(text: 'COUNTRY');
  TextEditingController city = TextEditingController(text: 'CITY');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            size: 36,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'PROFILE',
                style: GoogleFonts.permanentMarker(
                    color: Colors.black, fontSize: 36),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: CircleAvatar(
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        size: 36,
                        color: Colors.black,
                      )),
                  radius: 60,
                  backgroundColor: Colors.black12,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  showCursor: false,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.permanentMarker(
                      color: Colors.black, fontSize: 24),
                  controller: name,
                  onTap: () {
                    setState(
                      () {
                        name.text = '';
                      },
                    );
                  },
                  onChanged: (value) {
                    setState(() {
                      name.text = value;
                    });
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 150, 123, 84),
                        blurRadius: 3,
                        spreadRadius: 5,
                        offset: Offset(0, 3))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  showCursor: false,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.permanentMarker(
                      color: Colors.black, fontSize: 24),
                  controller: country,
                  onTap: () {
                    setState(
                      () {
                        country.text = '';
                      },
                    );
                  },
                  onChanged: (value) {
                    setState(() {
                      country.text = value;
                    });
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 150, 123, 84),
                        blurRadius: 3,
                        spreadRadius: 5,
                        offset: Offset(0, 3))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  showCursor: false,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.permanentMarker(
                      color: Colors.black, fontSize: 24),
                  controller: city,
                  onTap: () {
                    setState(
                      () {
                        city.text = '';
                      },
                    );
                  },
                  onChanged: (value) {
                    setState(() {
                      city.text = value;
                    });
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 150, 123, 84),
                        blurRadius: 3,
                        spreadRadius: 5,
                        offset: Offset(0, 3))
                  ],
                ),
              ),
              Container(
                width: 120,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black, blurRadius: 5, spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 150, 123, 84)),
                child: TextButton(
                  child: Text(
                    'DONE',
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
