import 'package:flutter/material.dart';
import 'package:flutterapp/screens/updatedAppsDetail.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store>
    with AutomaticKeepAliveClientMixin<Store> {
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: <Widget>[
                  _buildListRow1(),
                  //_buildListRow2(),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget _buildListRow1() {
    return Stack(
      children: <Widget>[
        headerSection(),
        Container(
            margin: EdgeInsets.only(top: 70.0),
            child: new ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppDetail()),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        appSection(),
                      ],
                    ),
                  );
                }))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget appSection() {
    return Stack(
      children: <Widget>[
        headerSection(),
        Container(
            margin: EdgeInsets.only(top: 70.0),
            child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppDetail()),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        bodySection(),
                      ],
                    ),
                  );
                }))
      ],
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
      width: 120.0,
      height: 30.0,
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
                ">",
                style: new TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container bodySection() {
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
    );
  }
}
