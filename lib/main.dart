import 'package:flutter/material.dart';
import 'HomePage.dart';


void main() {
  runApp(mainApp());
}

class mainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        debugShowCheckedModeBanner: false,
        //home: ListViewer());
      home: ListViewer()
    );
  }
}
