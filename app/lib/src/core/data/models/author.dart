import 'package:pontifex_archive/src/core/data/models/document.dart';
import 'package:pontifex_archive/src/core/domain/entities/author.dart';

class Author {
  final String id;
  final String name;
  final String country;
  final List<AuthorTranslation> translations;
  final List<Document> documents;
  final String imageUrl;

  Author(
      {required this.id,
      required this.name,
      required this.country,
      required this.translations,
      required this.documents,
      required this.imageUrl});
}
