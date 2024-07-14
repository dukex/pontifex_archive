import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pontifex_archive/src/core/data/providers/leigo_fm_provider.dart';
import 'package:pontifex_archive/src/core/data/providers/popes_provider.dart';
import 'package:http/http.dart' as http;

import 'popes_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('PopeProvider#fetchPopes get popes from api', () async {
    var textResponse =
        '[{ "number": 265, "id": "benedictus-xvi","image_url": "https://url/benedictus-xvi/image.jpg", "name": "Benedictus XVI", "personal_name": "Joseph Aloisius Ratzinger", "motto": "Cooperatores veritatis", "country": "Germany", "start_date": "2005-04-19", "end_date": "2013-02-28","translations": [{"language_code": "en","name": "Benedict XVI","motto": "Cooperators of the Truth"}],"documents": [{"id": "enc-20090629-caritas-in-veritate","authorId": "benedictus-xvi", "name": "Caritas in veritate","date": "2009-06-29","type": "enc","translations": [{"id": "en/enc-20090629-caritas-in-veritate","epub_url": "http://url/enc-20090629-caritas-in-veritate.epub","language_code": "en","vatican_url": "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html"}  ],"cover_url": "https://url/enc-20090629-caritas-in-veritate.png"}]}]';

    final client = MockClient();

    when(client.get(Uri.parse('https://pontifexarchive.leigo.fm/popes.json')))
        .thenAnswer((_) async => http.Response(textResponse, 200));

    var popeProvider = PopeProvider(LeigoFmProvider(client));

    var popes = await popeProvider.fetchPopes();
    var pope = popes[0];

    expect(pope.id, equals("benedictus-xvi"));
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
