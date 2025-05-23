import 'package:epub_view/epub_view.dart';
import 'package:pontifex_archive/core/data/repositories/document_repository.dart';
import 'package:pontifex_archive/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/features/reader/domain/entities/document.dart';

class DownloadEbook {
  final DocumentRepository repository;
  final PreferencesRepository preferences;

  DownloadEbook(this.repository, this.preferences);

  Future<EpubController?> call(DocumentEntity document) async {
    final cfi = await preferences.getPosition(document.id);

    return EpubController(
      document: repository.fetchEpub(document.translations
          .firstWhere((t) => t.languageCode == "pt")
          .epubUrl),
      epubCfi: cfi,
    );
  }
}
