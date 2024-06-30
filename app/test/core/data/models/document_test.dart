import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pontifex_archive/src/core/data/models/document.dart';

void main() {
  test('Document.fromJson create a new document', () {
    var jsonResponse = json.decode(
        '{"id": "enc-20090629-caritas-in-veritate","authorId": "benedictus-xvi", "name": "Caritas in veritate","date": "2009-06-29","type": "enc","translations": [{"id": "en/enc-20090629-caritas-in-veritate","epub_url": "http://url/enc-20090629-caritas-in-veritate.epub","language_code": "en","vatican_url": "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html"}  ],"cover_url": "https://url/enc-20090629-caritas-in-veritate.png"}');

    var document = Document.fromJson(jsonResponse);

    expect(document.id, equals('enc-20090629-caritas-in-veritate'));
    expect(document.authorId, equals('benedictus-xvi'));
    expect(document.type, equals('enc'));
    expect(document.name, equals('Caritas in veritate'));
    expect(document.coverUrl,
        equals("https://url/enc-20090629-caritas-in-veritate.png"));
    expect(document.date, equals(DateTime(2009, 6, 29)));
    expect(document.translations[0].id,
        equals("en/enc-20090629-caritas-in-veritate"));
    expect(document.translations[0].languageCode, equals("en"));
    expect(
        document.translations[0].vaticanUrl,
        equals(
            "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html"));
    expect(document.translations[0].epubUrl,
        equals("http://url/enc-20090629-caritas-in-veritate.epub"));
  });
}
