import 'package:shared_preferences/shared_preferences.dart';

class SessionData {
  static const String _userTokenKey = 'userToken';
  static const String _userRoleKey = 'userRole';

  static Future<void> setUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userTokenKey, token);
  }

  static Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userTokenKey);
  }

  static Future<void> setUserRole(String role) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userRoleKey, role);
  }

  static Future<String?> getUserRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userRoleKey);
  }

  static Future<bool> isUserCoordinator() async {
    return await getUserRole() == 'C';
  }

  static Future<bool> isUserAdmin() async {
    return await getUserRole() == 'A';
  }

  static Future<bool> isUserRunner() async {
    return await getUserRole() == 'R';
  }

  static Future<bool> isUserLoggedIn() async {
    return await getUserRole() != null;
  }
}
