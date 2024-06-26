import 'dart:ui';

import 'package:pontifex_archive/src/core/domain/entities/document.dart';

class AuthorEntity {
  final String id;
  final String name;
  final String country;
  final List<AuthorTranslation> translations;
  final List<DocumentEntity> documents;
  final String imageUrl;

  AuthorEntity(
      {required this.id,
      required this.name,
      required this.country,
      required this.translations,
      required this.documents,
      required this.imageUrl});

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
