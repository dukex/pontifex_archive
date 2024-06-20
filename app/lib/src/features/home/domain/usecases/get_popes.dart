import 'package:pontifex_archive/src/core/data/repositories/pope_repository.dart';
import 'package:pontifex_archive/src/core/domain/entities/pope.dart';

class GetPopes {
  final PopeRepository repository;

  GetPopes(this.repository);

  Future<List<PopeEntity>> call() async {
    final popes = await repository.getPopes();
    return popes
        .map((pope) => PopeEntity(
            id: pope.id,
            motto: pope.motto,
            name: pope.name,
            translations: pope.translations,
            country: pope.country,
            documents: pope.documents,
            startDate: pope.startDate,
            imageUrl: pope.imageUrl))
        .toList();
  }
}
