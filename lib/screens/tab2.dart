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
                  _buildListRow2(),
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
            margin: EdgeInsets.fromLTRB(15, 70, 0.0, 0.0),
            height: 100.0,
            child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppDetail()),
                      );
                    },
                    child: Card(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        leftSection(),
//                            middleSection(),
//                            SizedBox(
//                              width: 108,
//                            ),
//                            rightSection()
                      ],
                    )),
                  );
                }))
      ],
    );
  }

  Widget _buildListRow2() {
    return Stack(
      children: <Widget>[
        headerSection2(),
        Container(
            margin: EdgeInsets.fromLTRB(15, 70, 0.0, 0.0),
            height: 100.0,
            child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      leftSection(),
//                          middleSection(),
//                          SizedBox(
//                            width: 108,
//                          ),
//                          rightSection()
                    ],
                  ));
                }))
      ],
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


  Container headerSection() {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 20, 0.0, 0.0),
        //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 15, 0.0, 0.0),
              child: new Text(
                "Global Technology",
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
                backgroundColor: Colors.lightBlue,
                radius: 10.0,
                child: new Text(
                  ">",
                  style: new TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
            ),
            SizedBox(
              width: 100,
            ),
          ],
        ));
  }

  Container headerSection2() {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 20, 0.0, 0.0),
        //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 15, 0.0, 0.0),
              child: new Text(
                "L.I.F.E",
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
                backgroundColor: Colors.lightBlue,
                radius: 10.0,
                child: new Text(
                  ">",
                  style: new TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
            ),
            SizedBox(
              width: 100,
            ),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
