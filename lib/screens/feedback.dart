import 'package:flutter/material.dart';

class Feedback1 extends StatefulWidget {
  @override
  _Feedback1State createState() => _Feedback1State();
}

class _Feedback1State extends State<Feedback1> with AutomaticKeepAliveClientMixin<Feedback1>{
  @override
  Widget build(BuildContext context) {
    print('build About Us');
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Text(
          'Feedback',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
