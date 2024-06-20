import 'package:pontifex_archive/src/core/data/models/pope.dart';

abstract class PopeRepository {
  Future<List<Pope>> getPopes();
}
