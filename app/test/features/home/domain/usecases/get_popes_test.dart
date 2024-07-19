import 'package:cv/cv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pontifex_archive/core/data/models/document.dart';
import 'package:pontifex_archive/core/data/models/document_translation.dart';
import 'package:pontifex_archive/core/data/models/pope.dart';
import 'package:pontifex_archive/core/data/repositories/pope_repository.dart';
import 'package:pontifex_archive/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/features/home/domain/usecases/get_popes.dart';

import 'get_popes_test.mocks.dart';

@GenerateMocks([PopeRepository, PreferencesRepository])
void main() {
  cvAddConstructor(Document.new);
  cvAddConstructor(DocumentTranslation.new);

  final mockDocuments = [
    Document()
      ..fromMap({
        "id": '1',
        "authorId": '',
        "type": 'enc',
        "name": 'Deus caritas est',
        "date": '2022-02-21',
        "cover_url": '',
        "translations": []
      }),
    Document()
      ..fromMap({
        "id": '2',
        "authorId": '',
        "type": 'enc',
        "name": 'Deus caritas est II',
        "date": '2024-02-21',
        "cover_url": '',
        "translations": []
      }),
  ];
  final mockPopes = [
    Pope()
      ..fromMap({
        "name": 'Pope 1',
        "documents": [mockDocuments[0].toMap()],
        "id": 'pope-1',
        "motto": '',
        "country": '',
        "translations": [],
        "start_date": '2001-05-14',
        "imageUrl": '',
      }),
    Pope()
      ..fromMap({
        "name": 'Pope 2',
        "documents": [mockDocuments[1].toMap()],
        "id": 'pope-2',
        "motto": '',
        "country": '',
        "translations": [],
        "start_date": '2008-02-09',
        "imageUrl": ''
      })
  ];

  group("GetPopes tests", () {
    test('call test', () async {
      var mockRepository = MockPopeRepository();
      var preferencesRepository = MockPreferencesRepository();

      when(mockRepository.getPopes()).thenAnswer((_) async => mockPopes);
      when(preferencesRepository.getProgress(any)).thenAnswer((_) async => 1);

      var useCase = GetPopes(mockRepository, preferencesRepository);

      var popes = await useCase.call();

      expect(popes.length, equals(2));
      expect(popes[0].id, equals("pope-2"));
      expect(popes[0].name, equals("Pope 2"));
      expect(popes[0].startDate, equals(DateTime.parse('2008-02-09')));
      expect(popes[0].translations, equals([]));
      expect(popes[0].documents[0].readingProgress, equals(1));
    });
  });
}
