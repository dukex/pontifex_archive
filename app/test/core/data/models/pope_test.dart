import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pontifex_archive/core/data/models/pope.dart';

void main() {
  test('Pope.fromJson create a new pope', () {
    var jsonResponse = json.decode(
        '{ "number": 265, "id": "benedictus-xvi","image_url": "https://url/benedictus-xvi/image.jpg", "name": "Benedictus XVI", "personal_name": "Joseph Aloisius Ratzinger", "motto": "Cooperatores veritatis", "country": "Germany", "start_date": "2005-04-19", "end_date": "2013-02-28","translations": [{"language_code": "en","name": "Benedict XVI","motto": "Cooperators of the Truth"}],"documents": [{"id": "enc-20090629-caritas-in-veritate","authorId": "benedictus-xvi", "name": "Caritas in veritate","date": "2009-06-29","type": "enc","translations": [{"id": "en/enc-20090629-caritas-in-veritate","epub_url": "http://url/enc-20090629-caritas-in-veritate.epub","language_code": "en","vatican_url": "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html"}  ],"cover_url": "https://url/enc-20090629-caritas-in-veritate.png"}]}');

    var pope = Pope.fromJson(jsonResponse);

    expect(pope.id, equals("benedictus-xvi"));
    expect(pope.name, equals("Benedictus XVI"));
    expect(pope.motto, equals("Cooperatores veritatis"));
    expect(pope.country, equals("Germany"));
    expect(pope.imageUrl, equals("https://url/benedictus-xvi/image.jpg"));
    expect(pope.startDate, equals(DateTime.parse("2005-04-19")));

    expect(pope.translations[0].name, equals("Benedict XVI"));
    expect(pope.translations[0].languageCode, equals("en"));
    expect(pope.documents[0].id, equals('enc-20090629-caritas-in-veritate'));
    expect(pope.documents[0].authorId, equals('benedictus-xvi'));
    expect(pope.documents[0].type, equals('enc'));
    expect(pope.documents[0].name, equals('Caritas in veritate'));
    expect(pope.documents[0].coverUrl,
        equals("https://url/enc-20090629-caritas-in-veritate.png"));
    expect(pope.documents[0].date, equals(DateTime(2009, 6, 29)));
    expect(pope.documents[0].translations[0].id,
        equals("en/enc-20090629-caritas-in-veritate"));
    expect(pope.documents[0].translations[0].languageCode, equals("en"));
    expect(
        pope.documents[0].translations[0].vaticanUrl,
        equals(
            "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html"));
    expect(pope.documents[0].translations[0].epubUrl,
        equals("http://url/enc-20090629-caritas-in-veritate.epub"));
  });
}
