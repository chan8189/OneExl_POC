import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/homeScreen.dart';
import 'package:flutterapp/screens/pinCode.dart';
import 'package:flutterapp/tab_container.dart';
import 'package:flutterapp/utils/auth_utils.dart';
import 'package:flutterapp/utils/network_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  static final String routeName = 'login';

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String _grantType = "password";

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  bool _isError = false;
  bool _obscureText = true;
  bool _isLoading = false;
  TextEditingController _emailController, _passwordController;
  String _errorText, _emailError, _passwordError;

  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    String authToken = AuthUtils.getToken(_sharedPreferences);
    if (authToken != null) {
//      Navigator.of(_scaffoldKey.currentContext)
//          .pushReplacementNamed(HomeScreen.routeName);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PinCodeVerificationScreen();
      }));
    }
  }

  _showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  _hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          color: new Color.fromRGBO(239, 248, 255, 1),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: <Widget>[
                  headerSection(),
                  SizedBox(height: 100.0),
                  textSection(),
                  labelSection(),
                  buttonSection(),
                ],
              ),
      ),
    );
  }

  _authenticateUser() async {
    _showLoading();
    if (_valid()) {
      var responseJson = await NetworkUtils.authenticateUser(
          _emailController.text, _passwordController.text);

      print(responseJson);

      if (responseJson == null) {
        NetworkUtils.showSnackBar(_scaffoldKey, 'Something went wrong!');
      } else if (responseJson == 'NetworkError') {
        NetworkUtils.showSnackBar(_scaffoldKey, null);
      } else if (responseJson['errors'] != null) {
        NetworkUtils.showSnackBar(_scaffoldKey, 'Invalid Email/Password');
      } else {
        AuthUtils.insertDetails(_sharedPreferences, responseJson);
        /**
         * Removes stack and start with the new page.
         * In this case on press back on HomePage app will exit.
         * **/
        Navigator.of(_scaffoldKey.currentContext)
            .pushReplacementNamed(HomeScreen.routeName);
      }
      _hideLoading();
    } else {
      setState(() {
        _isLoading = false;
        _emailError;
        _passwordError;
      });
    }
  }

  _valid() {
    bool valid = true;

    if (_emailController.text.isEmpty) {
      valid = false;
      _emailError = "Email can't be blank!";
    }

    if (_passwordController.text.isEmpty) {
      valid = false;
      _passwordError = "Password can't be blank!";
    } else if (_passwordController.text.length < 6) {
      valid = false;
      _passwordError = "Password is invalid!";
    }

    return valid;
  }

  signIn(String username, pass) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      Map data = {
        'username': username,
        'password': pass,
        'grant_type': _grantType
      };
      var jsonResponse = null;
      // var response = await http.post("https://exlmobility-uat.exlservice.com/ONEEXL/token", body: data);
      var response = await http.post(
          Uri.encodeFull("https://exlmobility-uat.exlservice.com/ONEEXL/token"),
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: data);
      print(response.body);
      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        if (jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });
          sharedPreferences.setString("token", jsonResponse['access_token']);
          sharedPreferences.setString("userNameKey", jsonResponse['USERNAME']);
          sharedPreferences.setString(
              "employeddIdKey", jsonResponse['EMPLOYEE_ID']);
          sharedPreferences.setString(
              "employeddTypeKey", jsonResponse['EMPLOYEE_TYPE']);
          // print(jsonResponse['access_token']);
          // AuthUtils.insertDetails(_sharedPreferences, response.body);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => TabContainer()),
              (Route<dynamic> route) => false);
        }
      } else {
        print(response.body);
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('caught error: $e');
    }
  }

  Container labelSection() {
    return Container(
      margin: EdgeInsets.only(left: 250),
      child: FlatButton(
        child: Text(
          'Forgot password?',
          style: TextStyle(
            color: new Color.fromRGBO(255, 117, 28, 1),
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      // margin: EdgeInsets.only(top: 1.0),
      child: RaisedButton(
        onPressed: emailController.text == "" || passwordController.text == ""
            ? null
            : () {
                setState(() {
                  _isLoading = true;
                });
                signIn(emailController.text, passwordController.text);
                //_authenticateUser;
              },
        elevation: 0.0,
        color: new Color.fromRGBO(24, 85, 250, 1),
        child: Text("Sign In", style: TextStyle(color: Colors.white70)),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      ),
    );
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            cursorColor: Colors.black54,
            style: TextStyle(color: Colors.black54),
            //maxLength: 20,
            decoration: InputDecoration(
              hintText: "User Id",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.black54,
            obscureText: true,
            style: TextStyle(color: Colors.black54),
            //maxLength: 20,
            decoration: InputDecoration(
              hintText: "Password",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
        margin: EdgeInsets.only(top: 50.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('images/logo.png'),
        ));
  }
}
