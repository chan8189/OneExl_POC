import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'auth_utils.dart';

class NetworkUtils {
  static final String host = productionHost;
  static final String productionHost =
      'https://exlmobility.exlservice.com/ONEEXL/token';
  static final String developmentHost =
      'https://exlmobility-uat.exlservice.com/ONEEXL/token';
  static final String _grantType = "password";

  static dynamic authenticateUser(String email, String password) async {
    var uri = developmentHost;

    try {
      Map data = {
        'username': email,
        'password': password,
        'grant_type': _grantType
      };
//      final response = await http.post(uri,
//          headers: {"Content-Type": "application/x-www-form-urlencoded"},
//          body: data);
      //var jsonResponse = null;
      var response = await http.post(
          Uri.encodeFull("https://exlmobility.exlservice.com/ONEEXL/token"),
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
    prefs.setInt(AuthUtils.userIdKey, null);
    prefs.setString(AuthUtils.nameKey, null);
    Navigator.of(context).pushReplacementNamed('/');
  }

  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message ?? 'You are offline'),
    ));
  }

  static fetch(var authToken, var endPoint) async {
    var uri = host + endPoint;

    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': authToken},
      );

      final responseJson = json.decode(response.body);
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
