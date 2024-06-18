import 'package:pontifex_archive/src/core/data/models/document.dart';
import 'package:pontifex_archive/src/core/data/models/models.dart';

class Pope {
  final String id;
  final String name;
  final String motto;
  final String country;
  final DateTime startDate;
  final DateTime? endDate;
  final List<PopeTranslation> translations;
  final List<Document> documents;

  factory Pope.fromJson(Map<String, dynamic> json) {
    var documentsFromJson = json['documents'] as List;
    List<Document> documentList = documentsFromJson
        .map((document) => Document.fromJson(document))
        .toList();

    return Pope(
        id: json['id'],
        name: json['name'],
        motto: json['motto'],
        country: json['country'],
        startDate: DateTime.parse(json['startDate']),
        translations: [],
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
    this.endDate,
  });
}
