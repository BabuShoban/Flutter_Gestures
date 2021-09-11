import 'dart:ui';
import 'package:flutter/material.dart';
import 'Slider.dart';
import 'HomePage.dart';
import 'package:vodqaapp/Slider.dart';
import 'DoubleTap.dart';
import 'WebView.dart';
import 'package:vodqaapp/DragAndDrop.dart';
import 'PageViewer.dart';
import 'VerticalScroll.dart';
import 'LongPress.dart';

class ListViewer extends StatefulWidget {
  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  List<String> gestureType = [
    "Slider",
    "Horizontal Scrolling",
    "Drag & Drop",
    "Double Tap",
    "Long Press",
    "Web View",
    "Page Viewer"
  ];

  List<String> gestureDescription = [
    "Slide bar",
    "Demos horizontal swiping",
    "Demo drag & drop",
    "Demo double tap button",
    "Demo long press button",
    "View flutter dev page",
    "View photos in slide view"
  ];

  List<Widget> pages = [
    SliderPage(),
    VerticalScrollingPage(),
    DragAndDropPage(),
    DoubleTapPage(),
    LongPressPage(),
    WebviewPage(),
    PageViewer(),

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
            title: Center(
              child: Text(
                'Gestures',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            )),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: gestureType.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        gestureType[index],
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          gestureDescription[index],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {
                        print("Helo i am tapping");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pages[index]));
                      },
                    ),
                    Divider(thickness: 1),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
