import 'package:flutter/material.dart';
import 'package:flutterapp/screens/tab1.dart';
import 'package:flutterapp/screens/tab2.dart';
import 'package:flutterapp/screens/tab3.dart';
import 'package:flutterapp/screens/tab4.dart';
import 'package:flutterapp/utils/network_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabContainer extends StatefulWidget {
  TabContainer({Key key}) : super(key: key);

  @override
  _TabContainerState createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  List<Widget> originalList;
  Map<int, bool> originalDic;
  List<Widget> listScreens;
  List<int> listScreensIndex;

  int tabIndex = 0;
  Color tabColor = Colors.white;
  Color selectedTabColor = Colors.amber;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  var _authToken, _empId, _userName, _employeeType, _osType, _homeResponse;

  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();

    originalList = [Apps(), Store(), Issues(), Others()];
    originalDic = {0: true, 1: false, 2: false, 3: false};
    listScreens = [originalList.first];
    listScreensIndex = [0];
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
      //_osType = "ANDROID";
    });
    var responseJson = await NetworkUtils.fetch(
        authToken,
        'api/OneExlApp/GETCATEGORYWISEAPPLIST',
        _empId,
        _userName,
        _employeeType);

    if (responseJson == null) {
      // NetworkUtils.showSnackBar(_scaffoldKey, 'Something went wrong!');
    } else if (responseJson == 'NetworkError') {
      //NetworkUtils.showSnackBar(_scaffoldKey, null);
    } else if (responseJson['errors'] != null) {
      _logout();
    }

    setState(() {
      _homeResponse = responseJson.toString();
      print(_homeResponse);
    });
  }

  _logout() {
    NetworkUtils.logoutUser(_scaffoldKey.currentContext, _sharedPreferences);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.yellow,
      home: Scaffold(
        body: IndexedStack(index: tabIndex, children: listScreens),
        bottomNavigationBar: _buildTabBar(),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _selectedTab(int index) {
    if (originalDic[index] == false) {
      listScreensIndex.add(index);
      originalDic[index] = true;
      listScreensIndex.sort();
      listScreens = listScreensIndex.map((index) {
        return originalList[index];
      }).toList();
    }

    setState(() {
      tabIndex = index;
    });
  }

  Widget _buildTabBar() {
    var listItems = [
      BottomAppBarItem(iconData: Icons.home, text: 'Apps'),
      BottomAppBarItem(iconData: Icons.apps, text: 'Store'),
      BottomAppBarItem(iconData: Icons.bug_report, text: 'Issue'),
      BottomAppBarItem(iconData: Icons.more_vert, text: 'Others')
    ];

    var items = List.generate(listItems.length, (int index) {
      return _buildTabItem(
        item: listItems[index],
        index: index,
        onPressed: _selectedTab,
      );
    });

    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: Theme.of(context).primaryColor,
    );
  }

  Widget _buildTabItem({
    BottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    var color = tabIndex == index ? selectedTabColor : tabColor;
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: 24),
                Text(
                  item.text,
                  style: TextStyle(color: color, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomAppBarItem {
  BottomAppBarItem({this.iconData, this.text});

  IconData iconData;
  String text;
}
