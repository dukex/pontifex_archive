import 'package:pontifex_archive/src/core/data/repositories/preferences_repository_impl.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';

class SaveReadingPosition {
  final PreferencesRepositoryImpl preferences;

  SaveReadingPosition(this.preferences);

  Future<bool> call(DocumentEntity document, String? cfi) async {
    return preferences.saveCfi(document.id, cfi ?? "");
  }
}
