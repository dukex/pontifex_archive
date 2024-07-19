import 'package:pontifex_archive/features/reader/domain/entities/document_translation.dart';

class DocumentEntity {
  final String id;
  final List<DocumentTranslationEntity> translations;

  DocumentEntity({required this.id, required this.translations});
}
