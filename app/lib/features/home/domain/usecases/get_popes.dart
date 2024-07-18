import 'package:pontifex_archive/core/data/models/pope.dart';
import 'package:pontifex_archive/core/data/repositories/pope_repository.dart';
import 'package:pontifex_archive/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/core/domain/entities/document.dart';
import 'package:pontifex_archive/core/domain/entities/pope.dart';

class GetPopes {
  final PopeRepository repository;
  final PreferencesRepository preferencesRepository;

  GetPopes(this.repository, this.preferencesRepository);

  Future<List<PopeEntity>> call() async {
    List<Pope> popes = await repository.getPopes();

    return await Future.wait(_popeWithDocuments(popes));
  }

  Iterable<Future<PopeEntity>> _popeWithDocuments(List<Pope> popes) {
    return popes.map<Future<PopeEntity>>((pope) async {
      final documents = await Future.wait(_documentsWithReadingProgress(pope));

      return PopeEntity.fromPope(pope, documents);
    });
  }

  Iterable<Future<DocumentEntity>> _documentsWithReadingProgress(Pope pope) {
    return pope.documents.map<Future<DocumentEntity>>((document) async {
      final readingProgress =
          await preferencesRepository.getProgress(document.id);

      return DocumentEntity.fromDocument(document, readingProgress);
    });
  }
}
