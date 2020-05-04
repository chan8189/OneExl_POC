import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static final String endPoint = '/token';

  // Keys to store and fetch data from SharedPreferences
  static final String authTokenKey = 'access_token';
  static final String userIdKey = 'user_id';
  static final String userNameKey = 'USERNAME';
  static final String employeddIdKey = 'EMPLOYEE_ID';
  static final String employeddTypeKey = 'EMPLOYEE_TYPE';
  static final String roleKey = 'role';

  static String getToken(SharedPreferences prefs) {
    return prefs.getString(authTokenKey);
  }

  static insertDetails(SharedPreferences prefs, var response) {
    prefs.setString(authTokenKey, response['access_token']);
    var user = response['user'];
    prefs.setInt(employeddIdKey, user['EMPLOYEE_ID']);
    prefs.setString(userNameKey, user['USERNAME']);
  }
}
