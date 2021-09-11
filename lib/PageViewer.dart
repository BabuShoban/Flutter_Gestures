import 'package:flutter/material.dart';
import 'package:vodqaapp/Contents.dart';
import 'HomePage.dart';

class PageViewer extends StatefulWidget {
  @override
  _PageViewerState createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        backgroundColor: Colors.white,
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
            'Photos Slider',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: contents.length,
                  itemBuilder: (_, i) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          contents[i].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 60.0,
                          width: double.infinity,
                        ),
                        Image(
                          image: AssetImage(contents[i].image),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      contents.length, (index) => builder(index, context)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container builder(index, context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: currentIndex == index
              ? Theme.of(context).primaryColor
              : Colors.grey),
    );
  }
}
