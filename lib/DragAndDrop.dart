import 'dart:ui';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'data.dart';
import 'Draggable_Widget.dart';
import 'Utills.dart';

class DragAndDropPage extends StatefulWidget {
  @override
  _DragAndDropState createState() => _DragAndDropState();
}

class _DragAndDropState extends State<DragAndDropPage> {
  final List<Object> all = allAnimals;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            title: Text(
              'Drag and Drop Element',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
            ),
          ),
          body: Center(
            child: Column(children: [buildOrigin(), buildTargets(context)]),

            // child: Draggable(
            //   child: buildText("Drag Me", Colors.purple),
            //   feedback: Material(child: buildText("Dragged", Colors.green)),
            // ),
          )),
    );
  }

  Widget buildOrigin() => Stack(
        children: all.map((object) => DraggableWidget(object: object)).toList(),
      );

  Widget buildTargets(BuildContext context) => Container(
      child: buildTarget(context, text: 'Drop here', acceptType: ObjectType.land));

  Widget buildTarget(BuildContext context,
          {@required String text, @required ObjectType acceptType}) =>
      Padding(
        padding: const EdgeInsets.only(top:200.0),
        child: CircleAvatar(
            radius: 75,
            backgroundColor: Theme.of(context).primaryColor,
            child: DragTarget(
              builder: (context, candidateData, rejectedData) => Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              onWillAccept: (data) => true,
              onAccept: (data) {
                if (data.type == acceptType) {
                  Utils.showSnackBar(
                    context,
                    text: 'This Is Correct 🥳',
                    color: Colors.green,
                  );

                  setState(() {
                    score += 50;
                    all.removeWhere((animal) => animal.imageUrl == data.imageUrl);
                  });
                }
              },
            )),
      );
}

Widget buildText(String text, Color color) => Container(
      alignment: Alignment.center,
      width: 160,
      height: 100,
      color: color,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
