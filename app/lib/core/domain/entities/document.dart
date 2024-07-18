import 'dart:ui';

import 'package:pontifex_archive/core/data/models/document.dart';
import 'package:pontifex_archive/core/data/models/document_translation.dart';

class DocumentEntity {
  final String authorId;
  final String id;
  final DateTime date;
  final String type;
  final String name;
  final String coverUrl;
  final List<DocumentTranslation> translations;
  final double readingProgress;

  DocumentEntity({
    required this.authorId,
    required this.id,
    required this.date,
    required this.type,
    required this.name,
    required this.coverUrl,
    required this.translations,
    required this.readingProgress,
  });

  String nameLocale(Locale flutterLocale) {
    return name;
  }

  factory DocumentEntity.fromDocument(
      Document document, double readingProgress) {
    return DocumentEntity(
        authorId: document.authorId,
        id: document.id,
        date: document.date,
        type: document.type,
        name: document.name,
        coverUrl: document.coverUrl,
        translations: document.translations,
        readingProgress: readingProgress);
  }

  bool readingStarted() {
    return readingProgress > 0;
  }
}
