import 'dart:ui';

import 'package:pontifex_archive/src/core/data/models/document_translation.dart';

class DocumentEntity {
  final String authorId;
  final String id;
  final DateTime date;
  final String type;
  final String name;
  final List<DocumentTranslation> translations;

  DocumentEntity({
    required this.authorId,
    required this.id,
    required this.date,
    required this.type,
    required this.name,
    required this.translations,
  });

  String get url =>
      "https://emersonalmeida.wtf/pontifex_archive/$authorId/pt/$id.epub";
  String get coverUrl =>
      "https://emersonalmeida.wtf/pontifex_archive/covers/$id.png";

  String nameLocale(Locale flutterLocale) {
    return name;
  }
}
