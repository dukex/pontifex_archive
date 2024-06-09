import 'package:http/http.dart' as http;
import 'package:pontifex_archive/src/core/data/models/models.dart';
import 'dart:convert';

class DocumentProvider {
  final String apiUrl =
      'https://emersonalmeida.wtf/pontifex_archive/documents.json';

  Future<List<Document>> fetchDocuments() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((document) => Document.fromJson(document))
          .toList();
    } else {
      throw Exception('Failed to load documents');
    }
  }
}
