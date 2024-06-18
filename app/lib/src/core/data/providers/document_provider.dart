import 'package:http/http.dart' as http;
import 'package:pontifex_archive/src/core/data/models/document.dart';
import 'package:pontifex_archive/src/core/data/providers/popes_provider.dart';

class DocumentProvider {
  final String apiUrl =
      'https://emersonalmeida.wtf/pontifex_archive/documents.json';

  final PopeProvider _popeProvider = PopeProvider();

  Future<List<Document>> fetchDocuments() async {
    final popes = await _popeProvider.fetchPopes(http.Client());

    List<Document> documents = [];

    for (var pope in popes) {
      documents.addAll(pope.documents);
    }

    return documents;
  }
}
