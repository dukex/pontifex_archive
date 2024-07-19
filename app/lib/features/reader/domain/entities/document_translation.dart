import 'package:pontifex_archive/core/data/models/document_translation.dart';

class DocumentTranslationEntity {
  final String languageCode;
  final String epubUrl;

  factory DocumentTranslationEntity.fromModel(DocumentTranslation model) {
    return DocumentTranslationEntity(
        languageCode: model.languageCode.valueOrThrow,
        epubUrl: model.epubUrl.valueOrThrow);
  }

  DocumentTranslationEntity(
      {required this.languageCode, required this.epubUrl});
}
