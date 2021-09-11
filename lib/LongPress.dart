// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'HomePage.dart';

class LongPressPage extends StatefulWidget {
  @override
  _LongPressPageState createState() => _LongPressPageState();
}

class _LongPressPageState extends State<LongPressPage> {

  BuildContext dialogContext;

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
              'Long Press',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
            ),
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
                  'Long Press Me',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onLongPress: () => {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    dialogContext = context;
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(32.0),
                      title: Text("You have successfully Long Pressed !!"),
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
