abstract class PreferencesRepository {
  Future<bool> saveReadingProgress(String id, String position, double progress);

  Future<String> getPosition(String id);
  Future<double> getProgress(String id);
}
