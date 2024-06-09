abstract class PreferencesRepository {
  Future<String> get(String id, String fallback);
  Future<String> cfiTo(String id);
  Future<bool> saveCfi(String id, String cfi);
}
