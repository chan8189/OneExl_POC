import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_utils.dart';

class NetworkUtils {
  static final String host = productionHost;
  static final String productionHost =
      'https://exlmobility.exlservice.com/ONEEXL/token';
  static final String developmentHost =
      'https://exlmobility-uat.exlservice.com/ONEEXL/';
  static final String _grantType = "password";
  static final String _osType = "ANDROID";

  static dynamic authenticateUser(String username, String password) async {
    var uri = developmentHost;

    try {
      Map data = {
        'username': username,
        'password': password,
        'grant_type': _grantType
      };
//      final response = await http.post(uri,
//          headers: {"Content-Type": "application/x-www-form-urlencoded"},
//          body: data);
      //var jsonResponse = null;
      var response = await http.post(
          Uri.encodeFull("https://exlmobility-uat.exlservice.com/ONEEXL/token"),
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: data);

      final responseJson = json.decode(response.body);
      print(response.body);
      return responseJson;
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static logoutUser(BuildContext context, SharedPreferences prefs) {
    prefs.setString(AuthUtils.authTokenKey, null);
    prefs.setInt(AuthUtils.employeddIdKey, null);
    prefs.setString(AuthUtils.userNameKey, null);
    Navigator.of(context).pushReplacementNamed('/');
  }

  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message ?? 'You are offline'),
    ));
  }

  static fetch(
      var authToken, var endPoint, empId, userName, employeeType) async {
    var uri = developmentHost + endPoint;
//    Map data = {
//      'empId': empId,
//      'userName': userName,
//      'employeeType': employeeType,
//      'osType': _osType
//    };
    final msg = jsonEncode({
      "EMPLOYEE_ID": empId,
      "USERNAME": userName,
      "OS_TYPE": _osType,
      "EMPLOYEE_TYPE": employeeType
    });
//    final msg1 = jsonEncode({
//      "USERNAME": "Chandan144843",
//      "EMPLOYEE_ID": "144843",
//      "OS_TYPE": "ANDROID",
//      "EMPLOYEE_TYPE": "Employee"
//    });
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken'
    };
    try {
      final response = await http.post(uri, headers: headers, body: msg);

      final responseJson = json.decode(response.body);
      print(response.body);

      return responseJson;

    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }
}
