abstract class PreferencesProvider {
  Future<String?> getString(String s);
  Future<bool> setString(String key, String value);
  Future<double?> getDouble(String s);
  Future<bool> setDouble(String key, double value);
}
