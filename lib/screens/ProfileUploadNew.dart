import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sfw_microorganisms/components/uploadModel.dart';

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
  String selectedType='Select Sample Type';

  Offset position = Offset(200, 200);

  var p1 = null, p2 = null; // p1 start point of drag, p2 end point of drag
  var top = null, left = null; // top: dy offset , left dx offset
  double rectHeight = 0, rectWidth = 0;

  List<Offset> lengthPoints = [];
  var widthp1 = null, widthp2 = null; //offset
  bool ok = true;
  bool focusmode = false, lengthmode = false, widthmode = false;
  String focusdesc =
          "please add a rectangel around the Object you want to focus on with drag and drop motion",
      lengthdesc =
          "please mark the length of the object, by tapping on the all the corners along the length of the object",
      widthdesc =
          "please mark the width of the object, by zooming in and tapping on the one end and then on the other end of the object width";
  bool zoomDisabled = false;






  GlobalKey<ScaffoldState> key = GlobalKey();
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
                        ? UploadModel(
                            imageMicroWidth: int.parse(umWidth.text).toDouble(),
                          )
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




                                      if(isNumeric(umWidth.text) && isNumeric(umHeight.text)){
                                      setState(() {
                                        photoExists = true;
                                      });}
                                      else{
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Define your image real dimensions')));

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
                  if (focusmode)
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              focusdesc,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    color: Color(0xffc4c4c4),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          p1 = p2 = top = left = null;
                                          rectHeight = rectWidth = 0;
                                        });
                                      },
                                      child: Text(
                                        "Reset",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Color(0xffc4c4c4),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          focusmode = false;
                                        });
                                      },
                                      child: Text(
                                        "Done",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (lengthmode)
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              lengthdesc,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    color: Color(0xffc4c4c4),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          lengthPoints = [];
                                        });
                                      },
                                      child: Text(
                                        "Reset",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Color(0xffc4c4c4),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          lengthmode = false;
                                        });
                                      },
                                      child: Text(
                                        "Done",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (widthmode)
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              widthdesc,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    color: Color(0xffc4c4c4),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          widthp1 = widthp2 = null;
                                        });
                                      },
                                      child: Text(
                                        "Reset",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Color(0xffc4c4c4),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          widthmode = false;
                                        });
                                      },
                                      child: Text(
                                        "Done",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!(focusmode || lengthmode || widthmode))
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
                                                    MainAxisAlignment
                                                        .spaceAround,
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
                                                              print(
                                                                  selectedType);
                                                              Navigator.of(context).pop();
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
                  if (!(focusmode || lengthmode || widthmode))
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
                  if (!(focusmode || lengthmode || widthmode))
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
                  if (!(focusmode || lengthmode || widthmode))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            print(
                                'Connecting to Drive Navigating to second screen later');
                            print(umHeight.text +
                                '   ' +
                                umWidth.text +
                                '  ' +
                                country.text);
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
                  if (!(focusmode || lengthmode || widthmode))
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

class LengthPainter extends CustomPainter {
  LengthPainter({required this.points});

  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;

    // canvas.drawLine(points[0], points[1], paint);
    // if(points.length >= 3)canvas.drawLine(points[1], points[2], paint);

    for (int i = 1; i < points.length; i++) {
      canvas.drawLine(points[i - 1], points[i], paint);
    }

    // print(path);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class WidthPainter extends CustomPainter {
  WidthPainter({required this.p1, required this.p2});

  final Offset p1;
  final Offset p2;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    // print(p1);
    // print(p2);
    canvas.drawLine(p1, p2, paint);

    // print(path);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class UploaddModel extends StatefulWidget {
  const UploaddModel({Key? key}) : super(key: key);

  @override
  _UploaddModelState createState() => _UploaddModelState();
}

class _UploaddModelState extends State<UploaddModel> {
  Offset position = Offset(200, 200);

  var p1 = null, p2 = null; // p1 start point of drag, p2 end point of drag
  var top = null, left = null; // top: dy offset , left dx offset
  double rectHeight = 0, rectWidth = 0;

  List<Offset> lengthPoints = [];
  var widthp1 = null, widthp2 = null; //offset
  bool ok = true;
  String zoomLevelText = 'Zoom X2';
  bool focusmode = false, lengthmode = false, widthmode = false;
  String focusdesc =
          "please add a rectangel around the Object you want to focus on with drag and drop motion",
      lengthdesc =
          "please mark the length of the object, by tapping on the all the corners along the length of the object",
      widthdesc =
          "please mark the width of the object, by zooming in and tapping on the one end and then on the other end of the object width";
  bool jobStart = false;
  PhotoViewController _controller = new PhotoViewController();
  GlobalKey<RawGestureDetectorState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Stack(
        children: [
          Center(
              child: ClipRect(
            child: GestureDetector(
              key: globalKey,
              onTapDown: (TapDownDetails tap) {},
              onPanStart: (DragStartDetails d) {
                // print(d.localPosition);
                if (focusmode) {
                  setState(() {
                    p1 = d.localPosition;
                    p2 = p1;
                    rectHeight = rectWidth = 0;

                    top = p1.dy;
                    left = p1.dx;
                  });
                }

                if (lengthmode) {
                  setState(() {
                    if (lengthPoints.length == 0)
                      lengthPoints.add(d.localPosition);
                    ok = true;
                  });
                }

                if (widthmode) {
                  setState(() {
                    widthp1 = d.localPosition;
                    widthp2 = d.localPosition;
                  });
                }
              },
              onPanUpdate: (DragUpdateDetails d) {
                if (focusmode) {
                  setState(() {
                    p2 = d.localPosition;
                    rectHeight = (p2.dy - p1.dy).abs();
                    rectWidth = (p2.dx - p1.dx).abs();
                    if (p2.dx >= p1.dx && p2.dy >= p1.dy) {
                      top = p1.dy;
                      left = p1.dx;
                    } else if (p2.dx > p1.dx && p2.dy < p1.dy) {
                      top = p2.dy;
                      left = p1.dx;
                    } else if (p2.dx < p1.dx && p2.dy > p1.dy) {
                      top = p1.dy;
                      left = p2.dx;
                    } else {
                      top = p2.dy;
                      left = p2.dx;
                    }
                  });
                }

                if (lengthmode) {
                  setState(() {
                    if (ok) {
                      lengthPoints.add(d.localPosition);
                      ok = false;
                    } else {
                      lengthPoints.removeLast();
                      lengthPoints.add(d.localPosition);
                    }
                    // print(lengthPoints);
                  });
                }

                if (widthmode) {
                  setState(() {
                    widthp2 = d.localPosition;
                  });
                }
              },
              child: PhotoView(
                imageProvider: AssetImage('assets/images/example.jpg'),
                controller: _controller,
                disableGestures: jobStart,
              ),
            ),
          )),
          if (focusmode)
            Positioned(
              top: top,
              left: left,
              child: Container(
                height: rectHeight,
                width: rectWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.red,
                    width: 3,
                  ),
                ),
              ),
            ),
          if (lengthmode && lengthPoints.length >= 2 && jobStart)
            CustomPaint(
              child: PhotoView(
                imageProvider: AssetImage('assets/images/example.jpg'),
                controller: _controller,
                disableGestures: jobStart,
              ),
              painter: LengthPainter(points: lengthPoints),
            ),
          if (widthmode && widthp1 != null && widthp2 != null)
            CustomPaint(
              child: PhotoView(
                imageProvider: AssetImage('assets/images/example.jpg'),
                controller: _controller,
                disableGestures: jobStart,
              ),
              painter: WidthPainter(
                p1: widthp1,
                p2: widthp2,
              ),
            ),
        ],
      ),
    );
  }
}

class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

bool isNumeric(String string) {
  // Null or empty string is not a number
  if (string == null || string.isEmpty) {
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