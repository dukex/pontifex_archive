import 'package:pontifex_archive/src/features/search/data/repositories/search_repository.dart';
import 'package:pontifex_archive/src/features/search/domain/entities/search_suggestions.dart';

class Search {
  final SearchRepository searchRepository;

  Search(this.searchRepository);

  SearchSuggestions doSearch(String text) {
    if (text.length > 2) {
      return SearchSuggestions(
          title: "Ola", results: searchRepository.search(text));
    }
    return SearchSuggestions(title: "Ola", results: []);
  }

  Future<bool> setup() {
    return searchRepository.setup();
  }
}
