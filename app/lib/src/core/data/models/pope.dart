import 'package:pontifex_archive/src/core/data/models/document.dart';
import 'package:pontifex_archive/src/core/data/models/models.dart';

class Pope {
  final String id;
  final String name;
  final String motto;
  final String country;
  final String imageUrl;
  final DateTime startDate;
  final DateTime? endDate;
  final List<PopeTranslation> translations;
  final List<Document> documents;

  factory Pope.fromJson(Map<String, dynamic> json) {
    List<PopeTranslation> translationList = (json['translations'] as List)
        .map((translation) => PopeTranslation.fromJson(translation))
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
    required this.id,
    required this.name,
    required this.motto,
    required this.country,
    required this.translations,
    required this.documents,
    required this.startDate,
    required this.imageUrl,
    this.endDate,
  });
}
