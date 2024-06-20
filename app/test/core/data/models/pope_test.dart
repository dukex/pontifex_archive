import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pontifex_archive/src/core/data/models/pope.dart';

void main() {
  test('Pope.fromJson create a new pope', () {
    var jsonResponse = json.decode(
        '{ "id": "benedictus", "motto": "motto test", "country": "German", "startDate": "2019-12-10", "name": "Benedictus", "translations": [{"name": "Bento", "language": "pt"}], "documents": [{"id": "caritas", "type": "enc", "name": "Caritas", "date": "2020-01-01", "translations": [{"language": "pt", "vatican_url": "https://url.com", "name": "Amor"}]}] }');

    var pope = Pope.fromJson(jsonResponse);

    expect(pope.id, equals("benedictus"));
    expect(pope.name, equals("Benedictus"));
    expect(pope.motto, equals("motto test"));
    expect(pope.country, equals("German"));
    expect(pope.startDate, equals(DateTime.parse("2019-12-10")));
    // expect(pope.translations[0].name, equals("Bento"));
    // expect(pope.translations[0].language, equals("pt"));
    expect(pope.documents[0].id, equals('caritas'));
    expect(pope.documents[0].type, equals('enc'));
    expect(pope.documents[0].name, equals('Caritas'));
    expect(pope.documents[0].date, equals(DateTime(2020, 1, 1)));
    expect(pope.documents[0].translations[0].vaticanUrl,
        equals("https://url.com"));
    expect(pope.documents[0].translations[0].languageCode, equals("pt"));
  });
}
