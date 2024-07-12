import 'package:pontifex_archive/src/features/search/domain/entities/search_result.dart';

abstract class SearchRepository {
  Future<bool> setup();

  List<SearchResult> search(String text);
}
