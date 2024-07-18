import 'dart:convert';

import 'package:http/http.dart' as http;

class LeigoFmProvider {
  final baseURL = 'https://pontifexarchive.leigo.fm/api';

  final http.Client client;

  LeigoFmProvider(this.client);

  Uri _buildURL(String path) => Uri.parse("$baseURL$path");

  Future<T> get<T>(String path,
      {required T Function(dynamic body) decode}) async {
    final response = await client.get(_buildURL(path));

    if (response.statusCode == 200) {
      var result = json.decode(response.body);

      return decode(result);
    } else {
      throw Exception('Failed to load documents');
    }
  }
}
