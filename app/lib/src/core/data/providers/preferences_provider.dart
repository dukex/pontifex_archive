import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {
  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  Future<bool> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }
}
