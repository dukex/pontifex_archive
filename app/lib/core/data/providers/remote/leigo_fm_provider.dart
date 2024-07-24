import 'dart:convert';

import 'package:flutter/foundation.dart';
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
      return compute<String, T>(parseBody<T>(decode), response.body);
    } else {
      throw Exception('Failed to load documents');
    }
  }

  T Function(String message) parseBody<T>(
      T Function(dynamic responseBody) decode) {
    return (String message) {
      var result = json.decode(message);

      return decode(result);
    };
  }
}
