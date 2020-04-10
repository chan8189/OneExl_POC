import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> with AutomaticKeepAliveClientMixin<Store>{
  @override
  void initState() {
    super.initState();
    print('initState Tab2');
  }
  @override
  Widget build(BuildContext context) {
    print('build Tab2');
    return Scaffold(
      appBar: AppBar(
        title: Text('Exl Store'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Text(
          'This is content of Tab2',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


