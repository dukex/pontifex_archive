import 'package:pontifex_archive/src/core/data/models/models.dart';

class DocumentEntity {
  final String id;
  final Pope pope;
  final String date;
  final String type;
  final String name;
  final List<DocumentTranslation> translations;

  DocumentEntity({
    required this.id,
    required this.pope,
    required this.date,
    required this.type,
    required this.name,
    required this.translations,
  });

  String get url =>
      "https://emersonalmeida.wtf/pontifex_archive/${pope.id}/pt/$id.epub";
  String get coverUrl =>
      "https://emersonalmeida.wtf/pontifex_archive/covers/$id.png";
}
