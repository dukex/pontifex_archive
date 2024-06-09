import 'package:epub_view/epub_view.dart';
import 'package:pontifex_archive/src/core/data/repositories/document_repository.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';

class DocumentPreferences {
  final String cfi;

  DocumentPreferences({required this.cfi});
}

class DownloadEbook {
  final DocumentRepository repository;
  final PreferencesRepository preferences;

  DownloadEbook(this.repository, this.preferences);

  Future<EpubController?> call(DocumentEntity document) async {
    final cfi = await preferences.cfiTo(document.id);

    return EpubController(
      document: repository.fetchEpub(document.url),
      epubCfi: cfi,
    );
  }
}