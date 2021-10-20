import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sfw_microorganisms/components/uploadModel.dart';
import 'package:sfw_microorganisms/models/upload_model.dart';

class UploadForm extends StatefulWidget {
  const UploadForm({Key? key}) : super(key: key);

  @override
  _UploadFormState createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  TextEditingController country = TextEditingController(text: 'Country');
  TextEditingController state = TextEditingController(text: 'State');
  TextEditingController umHeight = TextEditingController(text: 'Height in μm ');
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
  String selectedType = 'Select Sample Type';

  PhotoViewController photoViewController = PhotoViewController();
  GlobalKey<ScaffoldState> key = GlobalKey();
  late UploadModel model;
  late UploadDataModel dataModel;
  late List<String> userDetails;
  String link='https://i.ibb.co/pKPyH80/2.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
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
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.33,
                    child: photoExists
                        ? model = UploadModel(
                            imageMicroWidth: int.parse(umWidth.text).toDouble(),
                            networkImage: NetworkImage(
                              link,
                            ),
                            photoViewController: photoViewController,
                            dataModel: dataModel = UploadDataModel(
                              imageMicroWidth:
                                  int.tryParse(umWidth.text)!.toDouble(),
                              networkImage: NetworkImage(
                                  'https://i.ibb.co/pKPyH80/2.jpg'),
                            ))
                        : Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.03),
                            child: Column(
                              children: [
                                Flexible(
                                    child: MaterialButton(
                                        onPressed: () {
                                          print('first Button pressed');
                                        },
                                        child: Container(
                                          child: Center(
                                              child: Text(
                                            'Upload Photo/Video',
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
                                                  color: Colors.black45,
                                                  width: 1)),
                                        ))),
                                Flexible(
                                  child: MaterialButton(
                                    onPressed: () {
                                      print(
                                          'button pressed, changing variable to true');

                                      if (isNumeric(umWidth.text) &&
                                          isNumeric(umHeight.text)) {
                                        setState(() {
                                          photoExists = true;
                                        });
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title:
                                                    Center(child: Text('Info')),
                                                content: Text(
                                                    'Please Zoom and move the Image to the preferred Position then finish setting focus, Length and Width for the microoganisme.'),
                                              );
                                            });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Please Define your image real dimensions')));
                                      }
                                    },
                                    child: Container(
                                      child: FittedBox(
                                        child: Text(
                                          'Select from online drive',
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
                                            color: Colors.black45, width: 1),
                                      ),
                                    ),
                                  ),
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
                                        content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          color: Colors.white,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ...speciesType.map((value) {
                                                  return Container(
                                                    height: 50,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                    child: TextButton(
                                                        style: TextButton.styleFrom(
                                                            primary:
                                                                Colors.grey,
                                                            backgroundColor:
                                                                Colors.white,
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .black45)),
                                                        onPressed: () {
                                                          setState(() {
                                                            selectedType =
                                                                value;
                                                            print(selectedType);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          });
                                                        },
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .black45),
                                                        )),
                                                  );
                                                })
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
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
                                  border: Border.all(
                                      color: Colors.black45, width: 1)),
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
                                  border: Border.all(
                                      color: Colors.black45, width: 1)),
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
                            padding: EdgeInsets.only(left: 5),
                            margin: EdgeInsets.only(
                                bottom: 12, left: 15, right: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black45, width: 1)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
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
                            margin: EdgeInsets.only(
                                bottom: 12, left: 15, right: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.black45, width: 1)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
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
                        onPressed: () async {
                          print('Everything is great!');

                          if (selectedType == 'Select Sample Type') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Please Select Sample Type')));
                          } else {



                            await model.dataModel.addUpload(
                                model.networkImage.url,
                                umWidth.text,
                                umHeight.text,
                                country.text,
                                state.text,
                                selectedType,
                                model.photoViewController.value.scale
                                    .toString(),
                                model.photoViewController.value.position,
                                model.dataModel.p1Rect.dx,
                                model.dataModel.p1Rect.dy,
                                model.dataModel.p2Rect.dx,
                                model.dataModel.p2Rect.dy,
                                model.dataModel.organismWidth,
                                model.dataModel.organismLength);
                          }
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
        ],
      ),
    );
  }
}

bool isNumeric(String string) {
  // Null or empty string is not a number
  if (string.isEmpty) {
    return false;
  }

  // Try to parse input string to number.
  // Both integer and double work.
  // Use int.tryParse if you want to check integer only.
  // Use double.tryParse if you want to check double only.
  final number = num.tryParse(string);

  if (number == null) {
    return false;
  }

  return true;
}
