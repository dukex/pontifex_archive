import 'package:pontifex_archive/src/features/search/data/repositories/search_repository.dart';
import 'package:pontifex_archive/src/features/search/domain/entities/search_result.dart';

class Search {
  final SearchRepository searchRepository;

  Search(this.searchRepository);

  List<SearchResult> doSearch(String text) {
    return searchRepository.search(text);
  }

  Future<bool> setup() {
    return searchRepository.setup();
  }
}
