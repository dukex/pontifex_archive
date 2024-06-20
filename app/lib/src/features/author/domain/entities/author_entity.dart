import 'dart:ui';

import 'package:pontifex_archive/src/core/data/models/document.dart';

class AuthorEntity {
  final String id;
  final String name;
  final String motto;
  final String country;
  final DateTime startDate;
  final DateTime? endDate;
  final List<AuthorTranslation> translations;
  final List<Document> documents;
  final String imageUrl;

  AuthorEntity({
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
          orElse: () => AuthorTranslation(languageCode: "la", name: name),
        )
        .name;
  }
}

class AuthorTranslation {
  final String languageCode;
  final String name;

  AuthorTranslation({
    required this.languageCode,
    required this.name,
  });

  factory AuthorTranslation.fromJson(Map<String, dynamic> json) {
    return AuthorTranslation(
        languageCode: json['language_code'], name: json['name']);
  }
}
