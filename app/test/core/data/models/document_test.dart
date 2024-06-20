import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pontifex_archive/src/core/data/models/document.dart';

void main() {
  test('Document.fromJson create a new document', () {
    var jsonResponse = json.decode(
        '{"id": "caritas", "type": "enc", "name": "Caritas", "date": "2020-01-01", "translations": [{"language": "pt", "vatican_url": "https://url.com"}]}');

    var document = Document.fromJson(jsonResponse);

    expect(document.id, equals('caritas'));
    expect(document.type, equals('enc'));
    expect(document.name, equals('Caritas'));
    expect(document.date, equals(DateTime(2020, 1, 1)));
    expect(document.translations[0].vaticanUrl, equals("https://url.com"));
    expect(document.translations[0].languageCode, equals("pt"));
  });
}
