import 'package:cv/cv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pontifex_archive/core/data/models/document.dart';
import 'package:pontifex_archive/core/data/models/document_translation.dart';
import 'package:pontifex_archive/core/data/models/pope.dart';
import 'package:pontifex_archive/core/data/providers/document_provider.dart';
import 'package:pontifex_archive/core/data/providers/popes_provider.dart';

import 'document_provider_test.mocks.dart';

@GenerateMocks([PopeProvider])
void main() {
  group('DocumentProvider tests', () {
    cvAddConstructor(Document.new);
    cvAddConstructor(DocumentTranslation.new);

    late DocumentProvider documentProvider;
    late MockPopeProvider mockPopeProvider;
    final mockDocuments = [
      Document()
        ..fromMap({
          "id": '1',
          "authorId": '',
          "type": 'enc',
          "name": 'Deus caritas est',
          "date": DateTime.now(),
          "cover_url": '',
          "translations": []
        }),
      Document()
        ..fromMap({
          "id": '2',
          "authorId": '',
          "type": 'enc',
          "name": 'Deus caritas est II',
          "date": DateTime.now(),
          "cover_url": '',
          "translations": []
        }),
    ];
    final mockPopes = [
      Pope()
        ..fromMap({
          "name": 'Pope 1',
          "documents": [mockDocuments[0].toMap()],
          "id": '',
          "motto": '',
          "country": '',
          "translations": [],
          "startDate": DateTime.now().toIso8601String(),
          "imageUrl": '',
        }),
      Pope()
        ..fromMap({
          "name": 'Pope 2',
          "documents": [mockDocuments[1].toMap()],
          "id": '',
          "motto": '',
          "country": '',
          "translations": [],
          "startDate": DateTime.now().toIso8601String(),
          "imageUrl": ''
        })
    ];

    setUp(() {
      mockPopeProvider = MockPopeProvider();
      documentProvider = DocumentProvider(mockPopeProvider);

      when(mockPopeProvider.fetchPopes()).thenAnswer((_) async => mockPopes);
    });

    test('fetchDocuments returns list of documents', () async {
      final documents = await documentProvider.fetchDocuments();

      expect(documents.length, 2);
      expect(documents, mockDocuments);
    });

    test('fetchDocument returns a document by id', () async {
      final document = await documentProvider.fetchDocument('1');

      expect(document.id.v, '1');
      expect(document.name.v, 'Deus caritas est');
    });
  });
}
