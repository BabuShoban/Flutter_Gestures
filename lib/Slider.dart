import 'package:flutter/material.dart';
import 'HomePage.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double value = 0;
  final double min = 0;
  final double max = 100;

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
            'Slider',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: SliderTheme(
          data: SliderThemeData(
            thumbColor: Colors.green,
            overlayColor: Colors.grey,
            valueIndicatorColor: Colors.grey,

            /// ticks in between
            activeTickMarkColor: Colors.transparent,
            inactiveTickMarkColor: Colors.transparent,

            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            trackHeight: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  slideLabel(min),
                  Container(
                    width: 350,
                    child: Slider(
                      value: value,
                      min: min,
                      max: max,
                      divisions: 100,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      label: value.round().toString(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                  slideLabel(max),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  value.round().toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  slideLabel(min),
                  Container(
                    width: 350,
                    child: Slider(
                      value: value,
                      min: min,
                      max: max,
                      divisions: 100,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      label: value.round().toString(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                  slideLabel(max),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget slideLabel(double value) => Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(
        value.round().toString(),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
