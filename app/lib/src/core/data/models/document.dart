import 'package:pontifex_archive/src/core/data/models/document_translation.dart';

class Document {
  final String id;
  final String type;
  final String name;
  final DateTime date;
  final List<DocumentTranslation> translations;

  Document({
    required this.id,
    required this.type,
    required this.name,
    required this.date,
    required this.translations,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    var translationsFromJson = json['translations'] as List;
    List<DocumentTranslation> translationList = translationsFromJson
        .map((i) => DocumentTranslation.fromJson(i))
        .toList();

    return Document(
      id: json['id'],
      date: DateTime.parse(json['date']),
      type: json['type'],
      name: json['name'],
      translations: translationList,
    );
  }
}
