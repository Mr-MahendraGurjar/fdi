import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String _tokenKey = "token";
  static const String _userName = "userName";
  static const String _userId = "userId";
  static const String _isLoggedIn = "isLoggedIn";

  static Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_tokenKey, token);
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey) ?? "";
  }

  static Future<bool> saveUserName(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userName, username);
  }

  static Future<bool> saveIsLoggedIn(bool loggedInStatus) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_isLoggedIn, loggedInStatus);
  }

  static Future<bool> getIsLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedIn) ?? false;
  }

  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName) ?? "";
  }

  static Future<bool> saveUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userId, userId);
  }

  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId) ?? "";
  }
}
