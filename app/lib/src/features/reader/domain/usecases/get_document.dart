import 'package:pontifex_archive/src/core/data/repositories/document_repository.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';

class GetDocument {
  final DocumentRepository repository;
  final PreferencesRepository preferencesRepository;

  GetDocument(this.repository, this.preferencesRepository);

  Future<DocumentEntity?> call(String id) async {
    final document = await repository.getDocument(id);

    final readingProgress =
        await preferencesRepository.getProgress(document.id);

    return DocumentEntity.fromDocument(document, readingProgress);
  }
}
