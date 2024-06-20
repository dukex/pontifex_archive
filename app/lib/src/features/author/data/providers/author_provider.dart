import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pontifex_archive/src/features/author/data/models/author.dart';

class AuthorProvider {
  static String apiUrl =
      'https://emersonalmeida.wtf/pontifex_archive/popes.json';

  Future<Author> getAuthor(http.Client client, String id) async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      final author = jsonResponse.firstWhere((author) => author['id'] == id);
      return Author.fromJson(author);
    } else {
      throw Exception('Failed to load author');
    }
  }
}
