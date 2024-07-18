import 'package:pontifex_archive/features/search/domain/entities/search_result.dart';

abstract class SearchProvider {
  Future<bool> setup();
  List<SearchResult> search(String text);
}
