import 'dart:convert';

import 'package:cv/cv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pontifex_archive/core/data/models/document.dart';
import 'package:pontifex_archive/core/data/models/document_translation.dart';

void main() {
  test('Document.fromMap create a new document', () {
    var jsonResponse = json.decode(
        '{"id": "enc-20090629-caritas-in-veritate","authorId": "benedictus-xvi", "name": "Caritas in veritate","date": "2009-06-29","type": "enc","translations": [{"id": "en/enc-20090629-caritas-in-veritate","epub_url": "http://url/enc-20090629-caritas-in-veritate.epub","language_code": "en","vatican_url": "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html"}  ],"cover_url": "https://url/enc-20090629-caritas-in-veritate.png"}');

    cvAddConstructor(DocumentTranslation.new);

    var document = Document()..fromMap(jsonResponse);

    expect(document.id.v, equals('enc-20090629-caritas-in-veritate'));
    expect(document.authorId.v, equals('benedictus-xvi'));
    expect(document.type.v, equals('enc'));
    expect(document.name.v, equals('Caritas in veritate'));
    expect(document.coverUrl.v,
        equals("https://url/enc-20090629-caritas-in-veritate.png"));
    expect(document.date.v, equals(DateTime(2009, 6, 29)));
    expect(document.translations.valueOrThrow[0].id.v,
        equals("en/enc-20090629-caritas-in-veritate"));
    expect(document.translations.valueOrThrow[0].languageCode.v, equals("en"));
    expect(
        document.translations.valueOrThrow[0].vaticanUrl.v,
        equals(
            "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html"));
    expect(document.translations.valueOrThrow[0].epubUrl.v,
        equals("http://url/enc-20090629-caritas-in-veritate.epub"));
  });
}
