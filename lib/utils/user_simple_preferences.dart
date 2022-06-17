import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;
  static const isLoggedIn = "userLoggedIn";
  static const token = "token";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLoggedIn(bool status) async =>
      await _preferences.setBool(isLoggedIn, status);

  static Future setToken(String tokens) async =>
      await _preferences.setString(token, tokens);

  static bool getUserStatus() => _preferences.getBool(isLoggedIn) ?? false;
  static String getToken() => _preferences.getString(token) ?? "";

  static removeValues() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    /* //Remove String
    prefs.remove("stringValue");
    //Remove bool
    prefs.remove("boolValue");
    //Remove int
    prefs.remove("intValue");
    //Remove double
    prefs.remove("doubleValue");*/
    _preferences.clear();
  }
}
