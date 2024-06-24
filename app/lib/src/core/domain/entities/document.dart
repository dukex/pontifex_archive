import 'dart:ui';

import 'package:pontifex_archive/src/core/data/models/document_translation.dart';

class DocumentEntity {
  final String authorId;
  final String id;
  final DateTime date;
  final String type;
  final String name;
  final String coverUrl;
  final List<DocumentTranslation> translations;

  DocumentEntity({
    required this.authorId,
    required this.id,
    required this.date,
    required this.type,
    required this.name,
    required this.coverUrl,
    required this.translations,
  });

  String nameLocale(Locale flutterLocale) {
    return name;
  }
}
