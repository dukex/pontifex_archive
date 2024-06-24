import 'package:pontifex_archive/src/core/data/models/document_translation.dart';

class Document {
  final String id;
  final String authorId;
  final String type;
  final String name;
  final DateTime date;
  final String coverUrl;
  final List<DocumentTranslation> translations;

  Document({
    required this.id,
    required this.authorId,
    required this.type,
    required this.name,
    required this.date,
    required this.coverUrl,
    required this.translations,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    var translationsFromJson = json['translations'] as List;
    List<DocumentTranslation> translationList = translationsFromJson
        .map((i) => DocumentTranslation.fromJson(i))
        .toList();

    return Document(
      id: json['id'],
      authorId: json['authorId'],
      date: DateTime.parse(json['date']),
      type: json['type'],
      name: json['name'],
      coverUrl: json['cover_url'],
      translations: translationList,
    );
  }
}
