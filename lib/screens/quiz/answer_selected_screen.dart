import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sfw_microorganisms/components/camera_component.dart';
import 'package:sfw_microorganisms/services/database_service.dart';
import 'package:sfw_microorganisms/styles/text_styles.dart';

class AnswerSelectedScreen extends StatefulWidget {
  const AnswerSelectedScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AnswerSelectedScreenState createState() => _AnswerSelectedScreenState();
}

class _AnswerSelectedScreenState extends State<AnswerSelectedScreen> {
  bool firstMenu = true;
  String selectedMenu = '';
  String selectedValue = '';
  Map<String, List<String>> filter = {
    'Nematode': [
      'Bacterial-feeding',
      'Fungal-feeding',
      'Predatory',
      'Root-feeding'
    ],
    'Protozoa': ['Flagellate', 'Ciliate', 'Amoebea'],
    'Filamentous': ['Actinobacteria', 'Fungi', 'Oomycetes'],
    'Bacteria': ['Aerobic', 'Anaerobic', 'Phatogenic'],
    'Other': ['Plant Matter', 'Dead Organism', 'Seed', 'Pollen', 'Other(enter']
  };
  PageController pageController = PageController();
  late String uploadId;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => debugPrint('coming soon'),
                    icon: Icon(Icons.style, size: 32.0),
                  ),

                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(title: Container(height: 300,child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Text('info Here')],),));
                          });
                    },
                    icon: Icon(Icons.info_outline_rounded, size: 32.0),
                  ),
                ],
              ),
              ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: FutureBuilder(
                    future: getUploads(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ParseObject>> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("Error..."),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(
                              child: Text("No Data..."),
                            );
                          } else {
                            return Container(
                              height: 300,
                              child: PageView.builder(
                                  controller: pageController,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int page) {
                                    
                                    uploadId = snapshot.data![page].get('objectId');
                                    return CameraComponent(
                                      link:
                                          snapshot.data![page].get('photoURL'),
                                      initialController: PhotoViewController(
                                          initialScale: double.tryParse(snapshot
                                              .data![page]
                                              .get('scale')),
                                          initialPosition: Offset(
                                              snapshot.data![page]
                                                  .get('positionDx')
                                                  .toDouble(),
                                              snapshot.data![page]
                                                  .get('positionDy')
                                                  .toDouble())),
                                      p1: Offset(
                                          snapshot.data![page].get('p1dx'),
                                          snapshot.data![page].get('p1dy')),
                                      p2: Offset(
                                          snapshot.data![page].get('p2dx'),
                                          snapshot.data![page].get('p2dy')),
                                    );
                                  }),
                            );
                          }
                      }
                    },
                  )),
              Center(
                child: SizedBox(
                  height: 50,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              firstMenu = true;
                              selectedMenu = '';

                            });
                          },
                          child: Text(
                            'Back',
                            style: TextStyle(color: firstMenu? Colors.transparent: Colors.black),
                          ),
                        ),
                      ),
                      Align(alignment: Alignment.centerRight,child: IconButton(
                          onPressed: () {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 1500),
                                curve: Curves.elasticOut);
                          },
                          icon: Icon(Icons.next_plan_outlined)),)


                    ],
                  ),
                ),
              ),
              firstMenu
                  ? Expanded(
                      child: ListView(children: [
                        ...filter.keys
                            .map(
                              (key) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedMenu = key;
                                    firstMenu = false;
                                  });
                                },
                                child: ListTile(

                                  shape: ContinuousRectangleBorder(
                                    side: BorderSide(),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  title: Text(
                                    key,
                                    textAlign: TextAlign.center,
                                    style: tabHeading,
                                  ),
                                ),
                              ),
                            )
                            .toList()
                      ]),
                    )
                  : Expanded(
                      child: ListView(
                        children: [
                          ...filter[selectedMenu]!
                              .map((value) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedValue = value;
                                    });
                                  },
                                  child: ListTile(
                                    onTap: (){showDialog(context: context, builder: (BuildContext context){
                                      return AlertDialog(title: Center(child: Text(selectedMenu)),actions: [Center(child: ElevatedButton(onPressed: (){Navigator.pop(context);},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(254,159, 101, 35))), child: Text('Confirm')))],content: Text('do you want to vote for this\nAnswer?\n\n\n Costs 2 Worms ',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),);
                                    });},
                                    shape: ContinuousRectangleBorder(
                                      side: BorderSide(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    title: Text(
                                      value,
                                      textAlign: TextAlign.center,
                                    ),
                                  )))
                              .toList()
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
