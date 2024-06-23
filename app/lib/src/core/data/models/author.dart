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

  factory Author.fromJson(Map<String, dynamic> json) {
    List<AuthorTranslation> translationList = (json['translations'] as List)
        .map((translation) => AuthorTranslation.fromJson(translation))
        .toList();
    List<Document> documentList = (json['documents'] as List)
        .map((document) => Document.fromJson(document))
        .toList();

    return Author(
        id: json['id'],
        name: json['name'],
        country: json['country'],
        imageUrl: json['image_url'],
        translations: translationList,
        documents: documentList);
  }
}
