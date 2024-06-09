import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {
  Future<String?> getString(String id) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(id);
  }
}
