import 'package:pontifex_archive/src/core/data/repositories/document_repository.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';

class GetDocument {
  final DocumentRepository repository;

  GetDocument(this.repository);

  Future<DocumentEntity?> call(String id) async {
    final documents = await repository.getDocuments();

    final doc = documents.where((d) => d.id == id).toList()[0];

    return DocumentEntity(
        authorId: doc.id, // TODO: fix it
        id: doc.id,
        date: doc.date,
        type: doc.type,
        name: doc.name,
        translations: doc.translations);
  }
}
