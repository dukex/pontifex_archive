import 'package:pontifex_archive/src/core/data/models/document.dart';
import 'package:pontifex_archive/src/features/author/domain/entities/author_entity.dart';

class Author {
  final String id;
  final String name;
  final String motto;
  final String country;
  final DateTime startDate;
  final DateTime? endDate;
  final List<AuthorTranslation> translations;
  final List<Document> documents;
  final String imageUrl;

  Author(
      {required this.id,
      required this.name,
      required this.motto,
      required this.country,
      required this.startDate,
      required this.endDate,
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
        motto: json['motto'],
        country: json['country'],
        imageUrl: json['image_url'],
        startDate: DateTime.parse(json['start_date']),
        endDate: DateTime.parse(json['start_date']),
        translations: translationList,
        documents: documentList);
  }
}
