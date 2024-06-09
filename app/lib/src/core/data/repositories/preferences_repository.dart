abstract class PreferencesRepository {
  Future<String> get(String id, String fallback);

  Future<String> cfiTo(String id);
}
