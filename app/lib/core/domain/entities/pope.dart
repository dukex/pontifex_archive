import 'package:pontifex_archive/core/data/models/pope.dart';
import 'package:pontifex_archive/core/domain/entities/author.dart';
import 'package:pontifex_archive/core/domain/entities/document.dart';

class PopeEntity extends AuthorEntity {
  final DateTime startDate;
  final DateTime? endDate;
  final String motto;

  PopeEntity(
      {required super.id,
      required super.name,
      required this.motto,
      required super.country,
      required super.translations,
      required super.documents,
      required this.startDate,
      required super.imageUrl,
      this.endDate});

  factory PopeEntity.fromPope(Pope pope, List<DocumentEntity> documents) {
    return PopeEntity(
        id: pope.id,
        motto: pope.motto,
        name: pope.name,
        translations: pope.translations,
        country: pope.country,
        documents: documents,
        startDate: pope.startDate,
        imageUrl: pope.imageUrl);
  }
}
