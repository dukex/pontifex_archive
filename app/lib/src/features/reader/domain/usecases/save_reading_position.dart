import 'package:pontifex_archive/src/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';

class SaveReadingPosition {
  final PreferencesRepository preferences;

  SaveReadingPosition(this.preferences);

  Future<bool> call(
      DocumentEntity document, String? cfi, double? progress) async {
    return preferences.saveReadingProgress(
        document.id, cfi ?? "", progress ?? 0);
  }
}
