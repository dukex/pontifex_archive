import 'package:pontifex_archive/core/data/repositories/document_repository.dart';
import 'package:pontifex_archive/core/data/repositories/preferences_repository.dart';
import 'package:pontifex_archive/features/reader/domain/entities/document.dart';
import 'package:pontifex_archive/features/reader/domain/entities/document_translation.dart';

class GetDocument {
  final DocumentRepository repository;

  GetDocument(this.repository);

  Future<DocumentEntity?> call(String id) async {
    final document = await repository.getDocument(id);

    final translations = (document.translations.v ?? [])
        .map((t) => DocumentTranslationEntity.fromModel(t))
        .toList();

    return DocumentEntity(
        id: document.id.valueOrThrow, translations: translations);
  }
}
