import 'package:pontifex_archive/src/core/data/models/pope.dart';
import 'package:pontifex_archive/src/core/data/providers/leigo_fm_provider.dart';

class PopeProvider {
  static String apiUrl =
      'https://emersonalmeida.wtf/pontifex_archive/popes.json';

  final LeigoFmProvider leigofm;

  PopeProvider(this.leigofm);

  Future<List<Pope>> fetchPopes() async {
    return leigofm.get<List<Pope>>('/popes.json',
        decode: (body) =>
            body.map<Pope>((document) => Pope.fromJson(document)).toList());
  }
}
