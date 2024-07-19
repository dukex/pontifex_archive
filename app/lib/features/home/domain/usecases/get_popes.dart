import 'package:pontifex_archive/core/by_desc.dart';
import 'package:pontifex_archive/core/data/models/pope.dart';
import 'package:pontifex_archive/core/data/repositories/pope_repository.dart';
import 'package:pontifex_archive/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/features/home/domain/entities/document.dart';
import 'package:pontifex_archive/features/home/domain/entities/pope.dart';

class GetPopes {
  final PopeRepository repository;
  final PreferencesRepository preferencesRepository;

  GetPopes(this.repository, this.preferencesRepository);

  Future<List<PopeEntity>> call() async {
    List<Pope> popes = await repository.getPopes();
    popes.sort(byDesc<Pope>((a) => a.startDate.v!));

    return await Future.wait(_popeWithDocuments(popes));
  }

  Iterable<Future<PopeEntity>> _popeWithDocuments(List<Pope> popes) {
    return popes.map<Future<PopeEntity>>((pope) async {
      final documents = await Future.wait(_documentsWithReadingProgress(pope));
      documents.sort(byDesc<DocumentEntity>((document) => document.date));

      return PopeEntity.fromPope(pope, documents);
    });
  }

  Iterable<Future<DocumentEntity>> _documentsWithReadingProgress(Pope pope) {
    return pope.documents.v!.map<Future<DocumentEntity>>((document) async {
      final readingProgress =
          await preferencesRepository.getProgress(document.id.v!);

      return DocumentEntity.fromDocument(document, readingProgress);
    });
  }
}
