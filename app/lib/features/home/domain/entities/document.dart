import 'package:pontifex_archive/core/data/models/document.dart';

class DocumentEntity {
  final String id;
  final DateTime date;
  final String name;
  final String coverUrl;
  final double readingProgress;

  DocumentEntity({
    required this.id,
    required this.date,
    required this.name,
    required this.coverUrl,
    required this.readingProgress,
  });

  factory DocumentEntity.fromDocument(
      Document document, double readingProgress) {
    return DocumentEntity(
        id: document.id.valueOrThrow,
        readingProgress: readingProgress,
        date: document.date.valueOrThrow,
        name: document.name.valueOrThrow,
        coverUrl: document.coverUrl.valueOrThrow);
  }

  bool readingStarted() {
    return readingProgress > 0;
  }
}
