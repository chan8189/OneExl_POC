import 'package:flutter/material.dart';

class Others extends StatefulWidget {
  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> with AutomaticKeepAliveClientMixin<Others>{
  @override
  void initState() {
    super.initState();
    print('initState Tab4');
  }
  @override
  Widget build(BuildContext context) {
    print('build Tab4');
    return Scaffold(
      appBar: AppBar(
        title: Text('Others'),
      ),
      body: Center(
        child: Text(
          'This is content of Tab4',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

