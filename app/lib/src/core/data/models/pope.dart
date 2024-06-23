import 'package:pontifex_archive/src/core/data/models/document.dart';
import 'package:pontifex_archive/src/core/data/models/author.dart';
import 'package:pontifex_archive/src/core/domain/entities/author.dart';

class Pope extends Author {
  final String motto;
  final DateTime startDate;
  final DateTime? endDate;

  factory Pope.fromJson(Map<String, dynamic> json) {
    List<AuthorTranslation> translationList = (json['translations'] as List)
        .map((translation) => AuthorTranslation.fromJson(translation))
        .toList();
    List<Document> documentList = (json['documents'] as List)
        .map((document) => Document.fromJson(document))
        .toList();

    return Pope(
        id: json['id'],
        name: json['name'],
        motto: json['motto'],
        country: json['country'],
        imageUrl: json['image_url'],
        startDate: DateTime.parse(json['start_date']),
        translations: translationList,
        documents: documentList);
  }

  Pope({
    required super.id,
    required super.name,
    required this.motto,
    required super.country,
    required super.translations,
    required super.documents,
    required this.startDate,
    required super.imageUrl,
    this.endDate,
  });
}
