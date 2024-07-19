import 'dart:ui';

import 'package:pontifex_archive/core/data/models/author_translation.dart';
import 'package:pontifex_archive/core/data/models/pope.dart';
import 'package:pontifex_archive/features/home/domain/entities/document.dart';

class PopeEntity {
  final String id;
  final String name;
  final List<DocumentEntity> documents;
  final List<AuthorTranslation> translations;
  final DateTime startDate;

  const PopeEntity(
      {required this.id,
      required this.name,
      required this.documents,
      required this.startDate,
      required this.translations});

  factory PopeEntity.fromPope(Pope pope, List<DocumentEntity> documents) {
    return PopeEntity(
        id: pope.id.valueOrThrow,
        name: pope.name.valueOrThrow,
        startDate: pope.startDate.valueOrThrow,
        documents: documents,
        translations: pope.translations.v!);
  }

  String nameLocale(Locale locale) {
    return name;
  }
}
