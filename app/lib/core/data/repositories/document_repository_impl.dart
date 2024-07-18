import 'package:epub_view/epub_view.dart';
import 'package:pontifex_archive/core/data/models/document.dart';
import 'package:pontifex_archive/core/data/providers/document_provider.dart';
import 'document_repository.dart';
import 'package:http/http.dart' as http;

class DocumentRepositoryImpl implements DocumentRepository {
  final DocumentProvider provider;

  DocumentRepositoryImpl(this.provider);

  @override
  Future<List<Document>> getDocuments() {
    return provider.fetchDocuments();
  }

  @override
  Future<Document> getDocument(String id) {
    return provider.fetchDocument(id);
  }

  @override
  Future<EpubBook> fetchEpub(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      return EpubReader.readBook(bytes);
    } else {
      throw Exception('Failed to load document from URL');
    }
  }
}
