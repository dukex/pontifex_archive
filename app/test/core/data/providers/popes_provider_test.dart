import 'package:cv/cv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pontifex_archive/core/data/models/author_translation.dart';
import 'package:pontifex_archive/core/data/models/document.dart';
import 'package:pontifex_archive/core/data/models/document_translation.dart';
import 'package:pontifex_archive/core/data/providers/remote/leigo_fm_provider.dart';
import 'package:pontifex_archive/core/data/providers/popes_provider.dart';
import 'package:http/http.dart' as http;

import 'popes_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('PopeProvider#fetchPopes get popes from api', () async {
    var textResponse =
        '[{ "number": 265, "id": "benedictus-xvi","image_url": "https://url/benedictus-xvi/image.jpg", "name": "Benedictus XVI", "personal_name": "Joseph Aloisius Ratzinger", "motto": "Cooperatores veritatis", "country": "Germany", "start_date": "2005-04-19", "end_date": "2013-02-28","translations": [{"language_code": "en","name": "Benedict XVI","motto": "Cooperators of the Truth"}],"documents": [{"id": "enc-20090629-caritas-in-veritate","authorId": "benedictus-xvi", "name": "Caritas in veritate","date": "2009-06-29","type": "enc","translations": [{"id": "en/enc-20090629-caritas-in-veritate","epub_url": "http://url/enc-20090629-caritas-in-veritate.epub","language_code": "en","vatican_url": "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html"}  ],"cover_url": "https://url/enc-20090629-caritas-in-veritate.png"}]}]';

    final client = MockClient();
    cvAddConstructor(AuthorTranslation.new);
    cvAddConstructor(Document.new);
    cvAddConstructor(DocumentTranslation.new);

    when(client
            .get(Uri.parse('https://pontifexarchive.leigo.fm/api/popes.json')))
        .thenAnswer((_) async => http.Response(textResponse, 200));

    var popeProvider = PopeProvider(LeigoFmProvider(client));

    var popes = await popeProvider.fetchPopes();
    var pope = popes[0];

    expect(pope.id.v, equals("benedictus-xvi"));
    expect(pope.name.v, equals("Benedictus XVI"));
    expect(pope.motto.v, equals("Cooperatores veritatis"));
    expect(pope.country.v, equals("Germany"));
    expect(pope.startDate.v, equals(DateTime.parse("2005-04-19")));
    // expect(pope.translations.v[0].name.v, equals("Bento"));
    // expect(pope.translations.v[0].language.v, equals("pt"));
    expect(
        pope.documents.v![0].id.v, equals('enc-20090629-caritas-in-veritate'));
    expect(pope.documents.v![0].type.v, equals('enc'));
    expect(pope.documents.v![0].name.v, equals('Caritas in veritate'));
    expect(pope.documents.v![0].date.v, equals(DateTime(2009, 6, 29)));
    expect(
        pope.documents.v![0].translations.v![0].vaticanUrl.v,
        equals(
            "https://www.vatican.va/content/benedict-xvi/en/encyclicals/documents/hf_ben-xvi_enc_20090629_caritas-in-veritate.html"));
    expect(
        pope.documents.v![0].translations.v![0].languageCode.v, equals("en"));
  });
}
