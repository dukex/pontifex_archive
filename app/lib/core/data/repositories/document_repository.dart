import 'package:epub_view/epub_view.dart';
import 'package:pontifex_archive/core/data/models/document.dart';

abstract class DocumentRepository {
  Future<List<Document>> getDocuments();
  Future<Document> getDocument(String id);

  Future<EpubBook> fetchEpub(String url);
}
