import 'dart:ui';

import 'package:pontifex_archive/src/core/data/models/document.dart';
import 'package:pontifex_archive/src/core/data/models/models.dart';

class PopeEntity {
  final String id;
  final String name;
  final String motto;
  final String country;
  final DateTime startDate;
  final DateTime? endDate;
  final List<PopeTranslation> translations;
  final List<Document> documents;
  final String imageUrl;

  PopeEntity({
    required this.id,
    required this.name,
    required this.motto,
    required this.country,
    required this.translations,
    required this.documents,
    required this.startDate,
    required this.imageUrl,
    this.endDate,
  });

  String nameLocale(Locale locale) {
    return translations
        .firstWhere(
          (translation) => translation.languageCode == locale.languageCode,
          orElse: () =>
              PopeTranslation(languageCode: "la", name: name, motto: motto),
        )
        .name;
  }
}
