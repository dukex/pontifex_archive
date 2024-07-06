import 'package:pontifex_archive/src/core/data/providers/preferences_provider.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository.dart';

class PreferencesRepositoryImpl extends PreferencesRepository {
  final PreferencesProvider provider;

  PreferencesRepositoryImpl(this.provider);

  @override
  Future<String> getPosition(String id) async {
    return await provider.getString("position:$id") ?? "";
  }

  @override
  Future<double> getProgress(String id) async {
    return await provider.getDouble("progress:$id") ?? 0;
  }

  @override
  Future<bool> saveReadingProgress(
      String id, String position, double progress) async {
    Future<bool> savePosition = provider.setString("position:$id", position);
    Future<bool> saveProgress = provider.setDouble("progress:$id", progress);

    return Future.value(savePosition)
        .then((save) => save ? saveProgress : false);
  }
}
