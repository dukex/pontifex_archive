import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pontifex_archive/src/core/data/providers/popes_provider.dart';
import 'package:http/http.dart' as http;

import 'popes_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('PopeProvider#fetchPopes get popes from api', () async {
    var textResponse =
        '[{"id": "benedictus", "motto": "motto test", "country": "German", "startDate": "2019-12-10", "name": "Benedictus", "translations": [{"name": "Bento", "language": "pt"}], "documents": [{"id": "caritas", "type": "enc", "name": "Caritas", "date": "2020-01-01", "translations": [{"language": "pt", "vatican_url": "https://url.com"}]}] }]';

    final client = MockClient();

    when(client.get(Uri.parse(PopeProvider.apiUrl)))
        .thenAnswer((_) async => http.Response(textResponse, 200));

    var popeProvider = PopeProvider();

    var popes = await popeProvider.fetchPopes(client);
    var pope = popes[0];

    expect(pope.id, equals("benedictus"));
    // expect(pope.name, equals("Benedictus"));
    // expect(pope.motto, equals("motto test"));
    // expect(pope.country, equals("German"));
    // expect(pope.startDate, equals(DateTime.parse("2019-12-10")));
    // // expect(pope.translations[0].name, equals("Bento"));
    // // expect(pope.translations[0].language, equals("pt"));
    // expect(pope.documents[0].id, equals('caritas'));
    // expect(pope.documents[0].type, equals('enc'));
    // expect(pope.documents[0].name, equals('Caritas'));
    // expect(pope.documents[0].date, equals(DateTime(2020, 1, 1)));
    // expect(pope.documents[0].translations[0].vaticanUrl,
    //     equals("https://url.com"));
    // expect(pope.documents[0].translations[0].language, equals("pt"));
  });
}
