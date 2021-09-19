import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<int> postList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
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
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Center(child: Text('Sort By',style: TextStyle(fontSize: 22),)),
                         content: Column( mainAxisSize: MainAxisSize.min,children: [
                            Container(decoration: BoxDecoration(color: Colors.white12,border: Border.all(color: Colors.black45),borderRadius: BorderRadius.circular(5)),margin: EdgeInsets.only(top: 10),child: Center(child: TextButton(onPressed: (){},child: Text('Date Of Upload',style: TextStyle(color: Colors.black45),)))),
                           Container(decoration: BoxDecoration(color: Colors.white12,border: Border.all(color: Colors.black45),borderRadius: BorderRadius.circular(5)),margin: EdgeInsets.only(top: 10),child: Center(child: TextButton(onPressed: (){},child: Text('Number Of Votes',style: TextStyle(color: Colors.black45))))),
                          ],
                         ),
                        );
                      });

                    },
                    icon: Icon(Icons.sort_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          title: Center(child: Text('Sort By',style: TextStyle(fontSize: 22),)),
                          content: Column( mainAxisSize: MainAxisSize.min,children: [
                            Container(decoration: BoxDecoration(color: Colors.white12,border: Border.all(color: Colors.black45),borderRadius: BorderRadius.circular(5)),margin: EdgeInsets.only(top: 10),child: Center(child: TextButton(onPressed: (){},child: Text('Filter 1',style: TextStyle(color: Colors.black45),)))),
                            Container(decoration: BoxDecoration(color: Colors.white12,border: Border.all(color: Colors.black45),borderRadius: BorderRadius.circular(5)),margin: EdgeInsets.only(top: 10),child: Center(child: TextButton(onPressed: (){},child: Text('Filter 2',style: TextStyle(color: Colors.black45),)))),
                            Container(decoration: BoxDecoration(color: Colors.white12,border: Border.all(color: Colors.black45),borderRadius: BorderRadius.circular(5)),margin: EdgeInsets.only(top: 10),child: Center(child: TextButton(onPressed: (){},child: Text('Filter 3',style: TextStyle(color: Colors.black45),)))),
                            Container(decoration: BoxDecoration(color: Colors.white12,border: Border.all(color: Colors.black45),borderRadius: BorderRadius.circular(5)),margin: EdgeInsets.only(top: 10),child: Center(child: TextButton(onPressed: (){},child: Text('Filter 4',style: TextStyle(color: Colors.black45),)))),
                            Container(decoration: BoxDecoration(color: Colors.white12,border: Border.all(color: Colors.black45),borderRadius: BorderRadius.circular(5)),margin: EdgeInsets.only(top: 10),child: Center(child: TextButton(onPressed: (){},child: Text('Filter 5',style: TextStyle(color: Colors.black45),)))),
                          ],
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
                          padding:  EdgeInsets.only(right: 6.0),
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
