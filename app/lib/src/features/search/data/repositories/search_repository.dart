import 'package:pontifex_archive/src/features/search/domain/entities/search_found.dart';

abstract class SearchRepository {
  Future<bool> setup();

  List<SearchResult> search(String text);
}
