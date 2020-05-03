import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapp/loginScreen.dart';
import 'package:flutterapp/screens/SplashScreen.dart';
import 'package:flutterapp/screens/pinCode.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Check(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new PinCodeVerificationScreen()
      }));
}

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  Future checkFirstSeen() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    bool _seen = (prefs.getBool('seen') ?? false);
//
//    if (_seen) {
//      Navigator.of(context).pushReplacement(
//          new MaterialPageRoute(builder: (context) => new loginScreen()));
//    } else {
//      await prefs.setBool('seen', true);
//      Navigator.of(context).pushReplacement(
//          new MaterialPageRoute(builder: (context) => new SplashScreen()));
//    }

    final prefs = await SharedPreferences.getInstance();
    int launchCount = prefs.getInt('counter') ?? 0;
    prefs.setInt('counter', launchCount + 1);
    if (launchCount == 0) {
      print("first launch");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SplashScreen();
      }));
      //setState to refresh or move to some other page
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return loginScreen();
      }));
    }
  }

//  Future<bool> checkFirstSeen() async {
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    bool isSplashScreenOpenedBefore =
//        sharedPreferences.getBool("isSplashScreenOpened") ?? false;
//    print(sharedPreferences.containsKey(
//        "isIntroScreenOpened")); // check your key either it is save or not?
//
//    if (isSplashScreenOpenedBefore == true) {
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//        return loginScreen();
//      }));
//    } else {
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//        return SplashScreen();
//      }));
//    }
//    return isSplashScreenOpenedBefore;
//  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
