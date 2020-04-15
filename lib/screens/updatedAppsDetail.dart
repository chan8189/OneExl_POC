import 'package:flutter/material.dart';

class AppDetail extends StatefulWidget {
  @override
  _AppDetailState createState() => _AppDetailState();
}

class _AppDetailState extends State<AppDetail>
    with AutomaticKeepAliveClientMixin<AppDetail> {
  @override
  Widget build(BuildContext context) {
    print('build About Us');
    return Scaffold(
      appBar: AppBar(
        title: Text('eVoyage'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0.0, 0.0),
            height: 120.0,
            width: 120.0,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('images/evoayge_app_icon.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0.0, 0.0),
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                "At EXL, we believe there is always a better way. We look deeper, we find it and make it happen. "
                "Our solutions integrate operations management services, analytics and technology platforms to deliver immediate results and long-termbusiness impact. We work as a strategic partner to help our clients streamline business operations, improvecorporatefinance, manage compliance, better adapt to change, and create new channels for growth.",
                overflow: TextOverflow.ellipsis,
                maxLines: 15,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          buttonSection()
        ],
      ),
    );
  }

  Container buttonSection() {
    return Container(
       margin: EdgeInsets.only(top: 10.0),
      //padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: new RaisedButton(
              elevation: 0.0,
              child: Text("Uninstall", style: TextStyle(color: Colors.black87)),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black87)),
              onPressed: () {},
              color: Colors.white10,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: new RaisedButton(
              elevation: 0.0,
              child: Text("Updated", style: TextStyle(color: Colors.white)),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.deepOrange)),
              onPressed: () {},
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
