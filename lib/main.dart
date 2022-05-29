// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

launchURLBrowser() async {
  const url = 'https://www.facebook.com';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'could not launch $url';
  }
}

launchURLApp() async {
  const url = 'https://www.facebook.com';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true, forceWebView: true);
  } else {
    throw 'could not launch $url';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'social',
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Social Application',
            ),
          ),
          body: Center(
            child: Column(children: [
              Container(
                height: 250.0,
              ),
              const Text(
                "welcome",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 50.0,
              ),
              const RaisedButton(
                onPressed: launchURLBrowser,
                child: Text(
                  'open in Browser',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(padding: EdgeInsets.only(top: 20)),
              const RaisedButton(
                onPressed: launchURLApp,
                child: Text(
                  'open in App',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
