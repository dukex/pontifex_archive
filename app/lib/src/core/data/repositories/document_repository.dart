import 'package:epub_view/epub_view.dart';
import 'package:pontifex_archive/src/core/data/models/models.dart';

abstract class DocumentRepository {
  Future<List<Document>> getDocuments();

  Future<EpubBook> fetchEpub(String url);
}