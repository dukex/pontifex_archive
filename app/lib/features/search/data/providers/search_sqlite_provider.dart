import 'package:http/http.dart';
import 'package:pontifex_archive/core/data/providers/remote/leigo_fm_provider.dart';
import 'package:pontifex_archive/features/search/data/providers/search_provider.dart';
import 'package:pontifex_archive/features/search/data/models/search_metadata.dart';
import 'package:pontifex_archive/features/search/domain/entities/search_result.dart';
import 'package:sqlite3/sqlite3.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class SearchSQLiteProvider implements SearchProvider {
  late Database? database;
  late String databasePath;
  late SearchMetadata metadata;
  final LeigoFmProvider leigofm;

  SearchSQLiteProvider(this.leigofm);

  @override
  Future<bool> setup() async {
    metadata = await _searchMetadata();
    databasePath = await _databasePath();

    var validatedDatabase = await _validateDatabase(retry: 5);

    if (validatedDatabase != null) {
      database = validatedDatabase;
      return true;
    }

    return false;
  }

  @override
  List<SearchResult> search(String text) {
    if (database == null) {
      // TODO: handle error
    }

    if (text.isEmpty) {
      return [];
    }

    ResultSet results = database!.select("""
    SELECT c.document_id, c.document_name, COUNT(c.id) as count
    FROM (
      SELECT id
      FROM search(?)
      ORDER BY bm25(search,0,10,5)
    ) s
    INNER JOIN chapters c ON c.id = s.id
    WHERE c.language_code = 'pt'
    GROUP BY c.document_id
    """, ["$text*"]);

    return results
        .map((result) => SearchResult(
            id: result.columnAt(0),
            title: result.columnAt(1),
            count: result.columnAt(2)))
        .toList();
  }

  Future<Database?> _validateDatabase({required int retry}) async {
    bool exists = await _checkFile();

    if (retry < 0) {
      return null;
    }

    if (!exists) {
      await _downloadIndex();
      return _validateDatabase(retry: retry - 1);
    }

    Database sqliteDatabase = await _sqliteDatabase();
    ResultSet checkVersion = sqliteDatabase.select(
        'SELECT version FROM chapters WHERE version = ? LIMIT 1',
        [metadata.version]);

    if (checkVersion.isEmpty) {
      await _downloadIndex();
      return _validateDatabase(retry: retry - 1);
    }

    return sqliteDatabase;
  }

  Future<bool> _checkFile() async {
    return await File(databasePath).exists();
  }

  Future<Database> _sqliteDatabase() async {
    return sqlite3.open(databasePath);
  }

  Future<void> _downloadIndex() async {
    File databaseFile = File(databasePath);
    if (databaseFile.existsSync()) {
      await databaseFile.delete();
    }

    await Directory(dirname(databasePath)).create(recursive: true);

    List<int> bytes = await _downloadFromUrl(metadata.url);

    await File(databasePath).writeAsBytes(bytes, flush: true);
  }

  Future<List<int>> _downloadFromUrl(String url) async {
    Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  Future<SearchMetadata> _searchMetadata() async {
    return leigofm.get<SearchMetadata>("/data/search.json",
        decode: (body) => SearchMetadata.fromJson(body));
  }

  Future<String> _databasePath() async {
    final dir = await getTemporaryDirectory();

    return "${dir.path}/search.db";
  }
}
