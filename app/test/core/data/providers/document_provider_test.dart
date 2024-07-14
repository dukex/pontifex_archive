import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pontifex_archive/src/core/data/models/document.dart';
import 'package:pontifex_archive/src/core/data/models/pope.dart';
import 'package:pontifex_archive/src/core/data/providers/document_provider.dart';
import 'package:pontifex_archive/src/core/data/providers/popes_provider.dart';

import 'document_provider_test.mocks.dart';

@GenerateMocks([PopeProvider])
void main() {
  group('DocumentProvider tests', () {
    late DocumentProvider documentProvider;
    late MockPopeProvider mockPopeProvider;
    final mockDocuments = [
      Document(
          id: '1',
          authorId: '',
          type: 'enc',
          name: 'Deus caritas est',
          date: DateTime.now(),
          coverUrl: '',
          translations: []),
      Document(
          id: '2',
          authorId: '',
          type: 'enc',
          name: 'Deus caritas est II',
          date: DateTime.now(),
          coverUrl: '',
          translations: []),
    ];
    final mockPopes = [
      Pope(
          name: 'Pope 1',
          documents: [mockDocuments[0]],
          id: '',
          motto: '',
          country: '',
          translations: [],
          startDate: DateTime.now(),
          imageUrl: ''),
      Pope(
          name: 'Pope 2',
          documents: [mockDocuments[1]],
          id: '',
          motto: '',
          country: '',
          translations: [],
          startDate: DateTime.now(),
          imageUrl: '')
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

      expect(document.id, '1');
      expect(document.name, 'Deus caritas est');
    });
  });
}
