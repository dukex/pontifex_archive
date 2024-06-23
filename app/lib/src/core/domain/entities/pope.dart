import 'package:pontifex_archive/src/core/domain/entities/author.dart';

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
}
