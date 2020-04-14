import 'package:flutter/material.dart';

class Apps extends StatefulWidget {
  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> with AutomaticKeepAliveClientMixin<Apps> {
  @override
  void initState() {
    super.initState();
    print('initState Tab1');
  }

  @override
  Widget build(BuildContext context) {
    print('build Tab1');
    return Scaffold(
      appBar: AppBar(
        title: Text('My Apps'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: new Container(
        child: new Stack(
          children: <Widget>[
            headerSection(),

            Container(
                margin: EdgeInsets.only(top: 50.0),
                child: new ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          leftSection(),
                          middleSection(),
                          SizedBox(
                            width: 108,
                          ),
                          rightSection()
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }

  Container leftSection() {
    return Container(
       // margin: EdgeInsets.only(top: 50.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30.0,
          child: Image.asset('images/evoayge_app_icon.png'),
        ));
  }

  Container middleSection() {
    return Container(
      child: new Container(
        //margin: EdgeInsets.only(top: 50.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text(
              "eVoyage",
              style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container rightSection() {
    return Container(
     // margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: new RaisedButton(
        elevation: 0.0,
        //color: new Color.fromRGBO(24, 85, 250, 1),
        child: Text("Update", style: TextStyle(color: Colors.deepOrange)),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.deepOrange)),
        onPressed: () {},
        color: Colors.white,
        //textColor: Colors.deepOrange,
      ),
    );
  }

  Container headerSection() {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
        //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 15, 0.0, 0.0),
              child: new Text(
                "Update Pending",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  wordSpacing: 2.0,
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 15, 0.0, 0.0),
              child: new CircleAvatar(
                backgroundColor: Colors.lightGreen,
                radius: 10.0,
                child: new Text(
                  "2",
                  style: new TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
            ),
            SizedBox(
              width: 100,
            ),
            new RaisedButton(
              elevation: 0.0,
              child:
                  Text("Update All", style: TextStyle(color: Colors.white70)),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blueGrey)),
              onPressed: () {},
              color: Colors.deepOrange[400],
              textColor: Colors.white,
            ),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
