import 'package:flutter/material.dart';
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:flutterapp/models/AppListResponse.dart';
import 'package:flutterapp/screens/updatedAppsDetail.dart';
import 'package:flutterapp/utils/network_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Apps extends StatefulWidget {
  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> with AutomaticKeepAliveClientMixin<Apps> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  var _authToken,
      _empId,
      _userName,
      _employeeType,
      _osType,
      _homeResponse,
      categoryWiseAppDetail;

  List<ListAppsDetailModel> allApps;

  var installedApps = [];

  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
    print('initState Tab1');
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    //String authToken = AuthUtils.getToken(_sharedPreferences);
    String authToken = _sharedPreferences.get("token");
    var id = _sharedPreferences.get("employeddIdKey");
    var name = _sharedPreferences.get("userNameKey");
    var employeeType = _sharedPreferences.get("employeddTypeKey");

    print(authToken);

    _fetchHome(authToken, id, name, employeeType);

    setState(() {
      _authToken = authToken;
      _empId = id;
      _userName = name;
      _employeeType = employeeType;
      _osType = "ANDROID";
    });

    if (_authToken == null) {
      _logout();
    }
  }

  _fetchHome(String authToken, id, name, employeeType) async {
    setState(() {
      _empId = id;
      _userName = name;
      _employeeType = employeeType;
    });
    var responseJson = await NetworkUtils.fetch(
        authToken,
        'api/OneExlApp/GETCATEGORYWISEAPPLIST',
        _empId,
        _userName,
        _employeeType);

//    final Map parsed = json.decode(responseJson);

    //assuming this json returns an array of signupresponse objects
    var categoryWiseAppDetail = List<ListCategoryWiseAppDetailModel>.of([]);
    var appListResponse = AppListResponse.fromJson(responseJson);
    if (appListResponse.response != null &&
        appListResponse.response.isSuccess) {
      categoryWiseAppDetail =
          appListResponse.response.data.listCategoryWiseAppDetailModel;
    }

    categoryWiseAppDetail.forEach((element) => {
          if (element.aPPCATEGORYNAME == "All Apps")
            {allApps = element.listAppsDetailModel}
        });

    Map<String, String> isAppAvailable;
    var localInstalledApps = [];
    for (var i = 0; i < allApps.length; i++) {
      // ignore: unnecessary_statements
      var app = allApps[i];
      try {
        isAppAvailable =
            await AppAvailability.checkAvailability(app.aNDROIDPACKAGENAME);
        var versionName = isAppAvailable["version_name"];
        if (versionName != null) {
          // installedApps.add(app);
          localInstalledApps.add(app);
        }
      } catch (e) {
        print(app.aPPNAME + "App not present");
      }
    }

    print("installed apps length" + installedApps.length.toString());

    setState(() {
      categoryWiseAppDetail = categoryWiseAppDetail;
      installedApps = localInstalledApps;
    });
  }

  _logout() {
    NetworkUtils.logoutUser(_scaffoldKey.currentContext, _sharedPreferences);
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
                    child: Card(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        leftSection(),
                        middleSection(),
                        SizedBox(
                          width: 108,
                        ),
                        rightSection()
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
            margin: EdgeInsets.only(top: 50.0),
            child: new ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      leftSection(),
                      middleSection(),
                      SizedBox(
                        width: 108,
                      ),
                      rightSection()
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
        margin: EdgeInsets.fromLTRB(15, 20, 0.0, 0.0),
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

  Container headerSection2() {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
        //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 15, 0.0, 0.0),
              child: new Text(
                "Updated Apps",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  wordSpacing: 2.0,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
