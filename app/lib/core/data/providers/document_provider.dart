import 'package:pontifex_archive/core/data/models/document.dart';
import 'package:pontifex_archive/core/data/providers/popes_provider.dart';

class DocumentProvider {
  final PopeProvider popeProvider;

  DocumentProvider(this.popeProvider);

  Future<List<Document>> fetchDocuments() async {
    final popes = await popeProvider.fetchPopes();

    List<Document> documents = [];

    for (var pope in popes) {
      documents.addAll(pope.documents);
    }

    return documents;
  }

  Future<Document> fetchDocument(String id) async {
    final documents = await fetchDocuments();

    return documents.firstWhere((document) => document.id == id);
  }
}
