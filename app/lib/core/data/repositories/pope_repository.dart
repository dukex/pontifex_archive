import 'package:pontifex_archive/core/data/models/pope.dart';

abstract class PopeRepository {
  Future<List<Pope>> getPopes();
}
