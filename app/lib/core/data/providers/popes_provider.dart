import 'package:pontifex_archive/core/data/models/pope.dart';
import 'package:pontifex_archive/core/data/providers/remote/leigo_fm_provider.dart';

class PopeProvider {
  final LeigoFmProvider leigofm;

  PopeProvider(this.leigofm);

  Future<List<Pope>> fetchPopes() async {
    return leigofm.get<List<Pope>>('/popes.json',
        decode: (body) =>
            body.map<Pope>((document) => Pope()..fromMap(document)).toList());
  }
}
