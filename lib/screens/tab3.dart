import 'package:flutter/material.dart';

class Issues extends StatefulWidget {
  @override
  _IssuesState createState() => _IssuesState();
}

class _IssuesState extends State<Issues> with AutomaticKeepAliveClientMixin<Issues>{
  @override
  void initState() {
    super.initState();
    print('initState Tab3');
  }
  @override
  Widget build(BuildContext context) {
    print('build Tab3');
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Issue'),
      ),
      body: Center(
        child: Text(
          'This is content of Tab3',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}



