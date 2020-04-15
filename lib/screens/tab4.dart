import 'package:flutter/material.dart';
import 'package:flutterapp/screens/about.dart';
import 'package:flutterapp/screens/feedback.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../loginScreen.dart';

class Others extends StatefulWidget {
  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others>
    with AutomaticKeepAliveClientMixin<Others> {
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
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: BodyLayout(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.feedback),
        title: Text('Feedback'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Feedback1()),
          );
        },
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('About Exl'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('About Exl');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUs()),
          );
        },
      ),
      ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Sign Out'),
        onTap: () async {
          print('Sign Out');
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.remove("token");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => loginScreen()),
              (Route<dynamic> route) => false);
        },
      ),
    ],
  );
}
