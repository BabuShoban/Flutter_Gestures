// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class DoubleTapPage extends StatefulWidget {
  @override
  _DoubleTapPageState createState() => _DoubleTapPageState();
}

class _DoubleTapPageState extends State<DoubleTapPage> {
  BuildContext dialogContext;
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
            'Double Tap',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20.0),
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey,
            ),
            child: GestureDetector(
              child: Center(
                child: Text(
                  'Double Tap Me',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onDoubleTap: () => {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    dialogContext = context;
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(32.0),
                      title: Text("You have successfully double tapped!!"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(dialogContext);
                          },
                          child: Text(
                            "okay",
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                      ],
                    );
                  },
                )
              },
            ),
          ),
        ),
      ),
    );
  }
}
