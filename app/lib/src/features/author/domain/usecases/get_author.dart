import 'package:pontifex_archive/src/features/author/data/repositories/author_repository.dart';
import 'package:pontifex_archive/src/features/author/domain/entities/author_entity.dart';

class GetAuthor {
  final AuthorRepository repository;

  GetAuthor(this.repository);

  Future<AuthorEntity> call(String id) async {
    final author = await repository.getAuthor(id);
    return AuthorEntity(
        id: author.id,
        motto: author.motto,
        name: author.name,
        translations: author.translations,
        country: author.country,
        documents: author.documents,
        startDate: author.startDate,
        imageUrl: author.imageUrl);
  }
}
