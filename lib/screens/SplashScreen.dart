import 'dart:async';

import 'package:flutter/material.dart';

import '../loginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    // Navigator.of(context).pushReplacementNamed('/HomeScreen');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return loginScreen();
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
    //checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Image.asset('images/splash_screen.png'),
      ),
    );
  }
}
