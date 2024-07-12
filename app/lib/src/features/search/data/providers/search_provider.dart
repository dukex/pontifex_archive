import 'package:pontifex_archive/src/features/search/domain/entities/search_result.dart';

abstract class SearchProvider {
  Future<bool> setup();
  List<SearchResult> search(String text);
}
