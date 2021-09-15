import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfw_microorganisms/screens/UploadFormSecond.dart';
class UploadForm extends StatefulWidget {
  const UploadForm({Key? key}) : super(key: key);

  @override
  _UploadFormState createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  TextEditingController country = TextEditingController(text: 'Country');
  TextEditingController state = TextEditingController(text: 'State');
  TextEditingController umHeight =
      TextEditingController(text: 'FoV Height in μm');
  TextEditingController umWidth =
      TextEditingController(text: 'FoV Width in μm');
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
              Container(height: 220,child: Column(children: [Flexible(
                  child: MaterialButton(
                      onPressed: () {
                        print('first Button pressed');
                      },
                      child: Container(
                        child: Center(child: Text('Upload Photo/Video',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300),)),
                        margin: EdgeInsets.only(bottom: 12),
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                            Border.all(color: Colors.black45, width: 1)),
                      ))),
                Flexible(
                  child: MaterialButton(
                      onPressed: () {
                        print('button pressed');

                      },
                      child: Container(
                        child: FittedBox(child: Text('Select from online drive',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300),),fit: BoxFit.none,),
                        margin: EdgeInsets.only(bottom: 12),
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.black45, width: 1)),
                      )),
                ),
                Flexible(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          margin: EdgeInsets.only(bottom: 24),
                          child: Text(
                            'Max 10s static video\nor photo',
                            style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),],),),

              Flexible(
                child: MaterialButton(
                    onPressed: () {
                      print('button pressed');

                      showDialog(context: context, builder: (BuildContext context) {

                      return AlertDialog(content: Container(height: 400,color: Colors.white,),);});



                    },
                    child: Container(
                      child: FittedBox(child: Text('Select Sample Type',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300,color: Colors.black45),),fit: BoxFit.none,),
                      margin: EdgeInsets.only(bottom: 12),
                      height: 100,
                      decoration: BoxDecoration(

                          color: Colors.white,
                          border: Border.all(color: Colors.black45, width: 1)),
                    )),
              ),
              Flexible(
                  child: Row(
                children: [
                  Flexible(
                    child: MaterialButton(
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
                          style: TextStyle(color: Colors.black45),
                          onTap: () {
                            country.text = '';
                          },
                          controller: country,
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
                        padding: EdgeInsets.only(left: 5),
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(

                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black45, width: 1)),
                        child: TextFormField(
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
              )),
              Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: MaterialButton(
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
                              style: TextStyle(color: Colors.black45),
                              onTap: () {
                                umHeight.text = '';
                              },
                              controller: umHeight,
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
                            padding: EdgeInsets.only(left: 5),
                            margin: EdgeInsets.only(bottom: 12, left: 0),
                            decoration: BoxDecoration(

                                color: Colors.white,
                                border:
                                Border.all(color: Colors.black45, width: 1)),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black45),
                              onTap: () {
                                umWidth.text = '';
                              },
                              controller: umWidth,
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
                  print('Connecting to Drive Navigating to second screen later');
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return SecondUploadForm(country: country.text,state: state.text,umHeight: umHeight.text,umWidth: umWidth.text,species: 'Parasite',);
                  }));
                    },
                    child: Container(height: 80, width: 240,


                  margin: EdgeInsets.only(bottom: 12,top: 24),
                  child: Center(
                    child: Text(
                      'Connect to your\nonline drive',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w600),
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
                  child: Center(child: Container(child: Text('Every Submit costs 5 Points')))),
            ],
          ),
        ),
      ),
    );
  }
}