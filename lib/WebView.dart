import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'HomePage.dart';

class WebviewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
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
                'Flutter Webview',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            body: WebView(
          initialUrl: 'https://flutter.dev/',
          javascriptMode: JavascriptMode.unrestricted,
        )
        )
    );
  }
}

// class WebViewLoad extends StatefulWidget {
//
//   WebViewLoadUI createState() => WebViewLoadUI();
//
// }
//
// class WebViewLoadUI extends State<WebViewLoad>{
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Text('WebView in Flutter')),
//         body: WebView(
//           initialUrl: 'https://google.com',
//           javascriptMode: JavascriptMode.unrestricted,
//
//         )
//     );
//   }
// }