import 'package:flutter/material.dart';
import 'HomePage.dart';

class VerticalScrollingPage extends StatefulWidget {
  @override
  _VerticalScrollingPageState createState() => _VerticalScrollingPageState();
}

class _VerticalScrollingPageState extends State<VerticalScrollingPage> {
  List<String> gestureType = [
    "Java",
    "C",
    "C++",
    "Java Script",
    "Python",
    "Ruby",
    "Swift",
    ".Net"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: Colors.grey,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 40.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListViewer()));
              },
            ),
            title: Center(
              child: Text(
                'Horizontal Scrolling',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            )),
        body: Container(
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: gestureType.length,
                    itemBuilder: (BuildContext context, int index) => Center(
                          child: Container(
                            height: 100,
                            width: 200,
                            margin: EdgeInsets.all(15),
                            color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  gestureType[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                //Divider(thickness: 1),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
