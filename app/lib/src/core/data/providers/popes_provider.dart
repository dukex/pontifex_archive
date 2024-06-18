import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pontifex_archive/src/core/data/models/pope.dart';

class PopeProvider {
  static String apiUrl =
      'https://emersonalmeida.wtf/pontifex_archive/popes.json';

  Future<List<Pope>> fetchPopes(http.Client client) async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((document) => Pope.fromJson(document)).toList();
    } else {
      throw Exception('Failed to load documents');
    }
  }
}
