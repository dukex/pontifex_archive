import 'package:pontifex_archive/features/search/domain/entities/search_result.dart';

abstract class SearchRepository {
  Future<bool> setup();

  List<SearchResult> search(String text);
}
