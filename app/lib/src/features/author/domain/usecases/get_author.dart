import 'package:pontifex_archive/src/core/domain/entities/document.dart';
import 'package:pontifex_archive/src/features/author/data/repositories/author_repository.dart';
import 'package:pontifex_archive/src/features/author/domain/entities/author_entity.dart';
import "package:collection/collection.dart";

class GetAuthor {
  final AuthorRepository repository;

  GetAuthor(this.repository);

  Future<AuthorEntity> call(String id) async {
    final author = await repository.getAuthor(id);

    List<DocumentEntity> documents = [
      author.documents[0],
      author.documents[1],
      author.documents[2],
      author.documents[0],
      author.documents[1],
      author.documents[2],
      author.documents[0],
      author.documents[1],
      author.documents[2],
      author.documents[0],
      author.documents[1],
      author.documents[2],
      author.documents[0],
      author.documents[1],
      author.documents[2],
      author.documents[0],
      author.documents[1],
      author.documents[2],
      author.documents[0],
      author.documents[1],
      author.documents[2]
    ]
        .map((document) => DocumentEntity(
            authorId: author.id,
            id: document.id,
            date: document.date,
            type: document.type,
            name: document.name,
            translations: document.translations))
        .toList();

    return AuthorEntity(
        id: author.id,
        motto: author.motto,
        name: author.name,
        translations: author.translations,
        country: author.country,
        documents: documents,
        documentsGroupedByType:
            groupBy(documents, (DocumentEntity document) => document.type),
        startDate: author.startDate,
        imageUrl: author.imageUrl);
  }
}
