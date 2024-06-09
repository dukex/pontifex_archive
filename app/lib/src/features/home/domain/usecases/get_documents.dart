import 'package:pontifex_archive/src/core/data/repositories/document_repository.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';

class GetDocuments {
  final DocumentRepository repository;

  GetDocuments(this.repository);

  Future<List<DocumentEntity>> call() async {
    final documents = await repository.getDocuments();
    return documents
        .map((doc) => DocumentEntity(
            id: doc.id,
            pope: doc.pope,
            date: doc.date,
            type: doc.type,
            url: doc.url,
            name: doc.name,
            translations: doc.translations))
        .toList();
  }
}
