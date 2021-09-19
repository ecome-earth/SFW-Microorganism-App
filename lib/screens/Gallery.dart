import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<int> postList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
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

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            child: (Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        print('Navigating Back...');
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_outlined)),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(
                                  child: Text(
                                'Sort By',
                                style: TextStyle(fontSize: 22),
                              )),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border:
                                              Border.all(color: Colors.black45),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      margin: EdgeInsets.only(top: 10),
                                      child: Center(
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Date Of Upload',
                                                style: TextStyle(
                                                    color: Colors.black45),
                                              )))),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border:
                                              Border.all(color: Colors.black45),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      margin: EdgeInsets.only(top: 10),
                                      child: Center(
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Text('Number Of Votes',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.black45))))),
                                ],
                              ),
                            );
                          });
                    },
                    icon: Icon(Icons.sort_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(
                                  child: Text(
                                'Filter By',
                                style: TextStyle(fontSize: 22),
                              )),
                              content: Container(
                                height: 300,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ...filter.keys.map(
                                        (index) => Container(
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white12,
                                              border: Border.all(
                                                  color: Colors.black45,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: ExpansionTile(
                                            title: Container(
                                              child: Center(
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    index,
                                                    style: TextStyle(
                                                        color: Colors.black45,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            children: [
                                              ...filter[index]!.map(
                                                (subIndex) => Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(
                                                              color: Colors
                                                                  .black45))),
                                                  margin:
                                                      EdgeInsets.only(top: 7),
                                                  child: Center(
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        subIndex,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black45,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    icon: Icon(Icons.filter_alt_outlined),
                  ),
                ],
              ),
            )),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Stack(children: [
                    Image.asset('assets/profile/placeholder.jpg'),
                    Positioned(
                      child: Text('98%'),
                      top: 10,
                      right: 10,
                    )
                  ]),
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    color: Colors.white70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: CircleAvatar(
                            child: Icon(Icons.group),
                          ),
                        ),
                        Text(' A little bit of description goes here'),
                        Padding(
                          padding: EdgeInsets.only(right: 6.0),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.message_outlined)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}
