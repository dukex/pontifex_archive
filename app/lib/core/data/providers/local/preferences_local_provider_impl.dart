import 'package:pontifex_archive/core/data/providers/preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocalProviderImpl implements PreferencesProvider {
  @override
  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }

  @override
  Future<double?> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getDouble(key);
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setDouble(key, value);
  }
}
