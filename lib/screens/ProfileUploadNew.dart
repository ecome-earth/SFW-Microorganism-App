import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfw_microorganisms/services/database_service.dart';


class UploadForm extends StatefulWidget {
  const UploadForm({Key? key}) : super(key: key);

  @override
  _UploadFormState createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  TextEditingController country = TextEditingController(text: 'Country');
  TextEditingController state = TextEditingController(text: 'City');
  TextEditingController umHeight =
      TextEditingController(text: 'Height in μm ');
  TextEditingController umWidth = TextEditingController(text: 'Width in μm ');
  bool photoExists = false;
  List<String> speciesType = [
    'Soil',
    'Potting Soil',
    'Compost',
    'Compost-Extract',
    'Compost-Tee',
    'Mulch',
    'Worm Casting',
    'Other'
  ];
  String selectedType='Select Sample Type';

String photoID ='';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      print('navigate to back');
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      size: 35,
                    ))
              ],
                ),

              ),
              Container(
                margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height) *
                    0.02,
                height: MediaQuery.of(context).size.height * 0.33,
                child: photoExists
                    ? Placeholder()
                    : Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),
                        child: Column(
                          children: [
                            Flexible(
                                child: MaterialButton(
                                    onPressed: () {
                                      print('first Button pressed');},
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                        'Upload From Gallery',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300),
                                      )),
                                      margin: EdgeInsets.only(bottom: 12),
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black45, width: 1)),
                                    ))),
                            Flexible(
                              child: MaterialButton(
                                  onPressed: () {
                                    print(
                                        'button pressed, changing variable to true');
                                    setState(() {
                                      photoExists = true;
                                    });
                                  },
                                  child: Container(
                                    child: FittedBox(
                                      child: Text(
                                        'Paste a link',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      fit: BoxFit.none,
                                    ),
                                    margin: EdgeInsets.only(bottom: 12),
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black45, width: 1)),
                                  )),
                            ),
                            Flexible(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 14),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Max 10s static video or photo',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                  children: [
                    Flexible(
                      child: MaterialButton(
                          onPressed: () {
                            print('button pressed');

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Center(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height * 0.6,
                                        color: Colors.white,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ...speciesType.map((value) {
                                                return Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.7,
                                                  child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          primary: Colors.grey,
                                                          backgroundColor:
                                                              Colors.white,
                                                          side: BorderSide(
                                                              color: Colors.black45)),
                                                      onPressed: () {
                                                        setState(() {
                                                          selectedType = value;
                                                          print(selectedType);
                                                          Navigator.of(context).pop();
                                                        });
                                                      },
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.black45),
                                                      )),
                                                );
                                              })
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(

                            height: MediaQuery.of(context).size.height*0.18,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(
                                child: Text(
                                  selectedType,
                                  style: TextStyle(

                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black45),
                                ),
                              ),
                            ),
                            margin: EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black45, width: 1)),
                          )),
                    ),
                  ],
                ),
              ),
              Flexible(
                  child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      highlightColor: Colors.white,
                      focusColor: Colors.white,
                      onPressed: () {
                        print('first Button pressed');
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 10),
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black45, width: 1)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                          ),
                          style: TextStyle(color: Colors.black45),
                          onTap: () {
                            country.text = '';
                          },
                          controller: country,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      highlightColor: Colors.white,
                      focusColor: Colors.white,
                      onPressed: () {
                        print('first Button pressed');
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black45, width: 1)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              hoverColor: Colors.white),
                          style: TextStyle(color: Colors.black45),
                          onTap: () {
                            state.text = '';
                          },
                          controller: state,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5 ),
                        margin: EdgeInsets.only(bottom: 12,left: 15,right: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border.all(color: Colors.black45, width: 1)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                          ),
                          style: TextStyle(color: Colors.black45),
                          onTap: () {
                            umHeight.text = '';
                          },
                          controller: umHeight,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(bottom: 12,left: 15,right: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                            Border.all(color: Colors.black45, width: 1)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              hoverColor: Colors.white),
                          style: TextStyle(color: Colors.black45),
                          onTap: () {
                            umWidth.text = '';
                          },
                          controller: umWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      print(
                          'Connecting to Drive Navigating to second screen later');
                      print(umHeight.text+'   '+ umWidth.text + '  ' + country.text);
                      addUpload('http://something.com', umWidth.text, umHeight.text, country.text, state.text, selectedType);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.55,
                      margin: EdgeInsets.only(bottom: 12, top: 24),
                      child: Center(
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
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
              Flexible(
                  child: Center(
                      child: Container(
                          child: Text(
                'Every submit costs 5 points',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )))),
            ],
          ),
        ),
      ),
    );
  }
}
