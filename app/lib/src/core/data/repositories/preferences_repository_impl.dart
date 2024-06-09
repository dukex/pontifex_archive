import 'package:pontifex_archive/src/core/data/providers/preferences_provider.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository.dart';

class PreferencesRepositoryImpl extends PreferencesRepository {
  final PreferencesProvider provider;

  PreferencesRepositoryImpl(this.provider);

  @override
  Future<String> get(String id, String fallback) async {
    return await provider.getString(id) ?? fallback;
  }

  @override
  Future<String> cfiTo(String id) {
    return get("cfi:$id", "");
  }
}
