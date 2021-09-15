import 'package:flutter/material.dart';

class SecondUploadForm extends StatefulWidget {
  final String country;
  final String state;
  final String umHeight;
  final String umWidth;
  final String species;
  const SecondUploadForm(
      {Key? key,
      required this.country,
      required this.state,
      required this.umHeight,
      required this.umWidth, required this.species})
      : super(key: key);

  @override
  _SecondUploadFormState createState() => _SecondUploadFormState();
}

class _SecondUploadFormState extends State<SecondUploadForm> {
  String testingString = 'parasite';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Container(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          print('navigate to back');


                        },
                        icon: Icon(
                          Icons.arrow_back_outlined,
                          size: 35,
                        ))
                  ],
                ),
                margin: EdgeInsets.only(bottom: 20),
              )),
              Container(margin: EdgeInsets.only(bottom: 20),
                height: 200,
                child: Placeholder()
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: FittedBox(
                        child: Center(
                          child: Text(
                            testingString,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45),
                          ),
                        ),
                        fit: BoxFit.none,
                      ),
                      margin: EdgeInsets.only(bottom: 12),
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black45, width: 1)),
                    ),
                  ],
                ),
              ),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: MaterialButton(
                      onPressed: () {
                        print('first Button pressed');
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black45, width: 1)),
                        child: Center(
                          child: Text(this.widget.country,
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: MaterialButton(
                      onPressed: () {
                        print('first Button pressed');
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black45, width: 1)),
                        child: Center(
                          child: Text(
                            this.widget.state,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: MaterialButton(
                      onPressed: () {
                        print('first Button pressed');
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black45, width: 1)),
                        child: Center(
                          child: Text(
                            this.widget.umHeight,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: MaterialButton(
                      onPressed: () {
                        print('first Button pressed');
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(bottom: 12, left: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black45, width: 1)),
                        child: Center(
                          child: Text(
                            this.widget.umWidth,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      print('Connecting to Drive');
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      margin: EdgeInsets.only(bottom: 12, top: 24),
                      child: Center(
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Flexible(
                  child: Center(
                      child: Container(
                          child: Text('Every Submit costs 5 Points')))),
            ],
          ),
        ),
      ),
    );
  }
}
