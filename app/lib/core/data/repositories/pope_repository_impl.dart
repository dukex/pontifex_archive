import 'package:pontifex_archive/core/data/models/pope.dart';
import 'package:pontifex_archive/core/data/providers/popes_provider.dart';
import 'package:pontifex_archive/core/data/repositories/pope_repository.dart';

class PopeRepositoryImpl implements PopeRepository {
  final PopeProvider provider;

  PopeRepositoryImpl(this.provider);

  @override
  Future<List<Pope>> getPopes() {
    return provider.fetchPopes();
  }
}
