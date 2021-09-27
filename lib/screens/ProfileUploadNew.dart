import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';

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
  String? selectedType;

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
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
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
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
                                      } else if (p2.dx > p1.dx &&
                                          p2.dy < p1.dy) {
                                        top = p2.dy;
                                        left = p1.dx;
                                      } else if (p2.dx < p1.dx &&
                                          p2.dy > p1.dy) {
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
                                child: Container(
                                  height: 200.0,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/images/logo.png',
                                        ),
                                      ),
                                      if (focusmode &&
                                          top != null &&
                                          left != null)
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
                                      if (lengthmode &&
                                          lengthPoints.length >= 2)
                                        CustomPaint(
                                          painter: LengthPainter(
                                              points: lengthPoints),
                                        ),
                                      if (widthmode &&
                                          widthp1 != null &&
                                          widthp2 != null)
                                        CustomPaint(
                                          painter: WidthPainter(
                                            p1: widthp1,
                                            p2: widthp2,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      color: focusmode
                                          ? Color(0xff20E46E)
                                          : Color(0xffc4c4c4),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            focusmode = true;
                                            lengthmode = widthmode = false;
                                          });
                                        },
                                        child: Text(
                                          "focus",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: lengthmode
                                          ? Color(0xff20E46E)
                                          : Color(0xffc4c4c4),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            lengthmode = true;
                                            focusmode = widthmode = false;
                                          });
                                        },
                                        child: Text(
                                          "length",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: widthmode
                                          ? Color(0xff20E46E)
                                          : Color(0xffc4c4c4),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            widthmode = true;
                                            lengthmode = focusmode = false;
                                          });
                                        },
                                        child: Text(
                                          "width",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
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
                                      setState(() {
                                        photoExists = true;
                                      });
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
                                        'Select Sample Type',
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
