import 'package:pontifex_archive/src/features/search/domain/entities/search_found.dart';

class SearchSuggestions {
  final String title;
  final List<SearchResult> results;

  SearchSuggestions({required this.title, required this.results});
}
