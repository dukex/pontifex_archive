import 'package:pontifex_archive/src/core/data/models/models.dart';

class DocumentEntity {
  final String id;
  final Pope pope;
  final String date;
  final String type;
  final String url;
  final String name;
  final List<DocumentTranslation> translations;

  DocumentEntity({
    required this.id,
    required this.pope,
    required this.date,
    required this.type,
    required this.url,
    required this.name,
    required this.translations,
  });
}
