import 'package:pontifex_archive/features/search/data/providers/search_provider.dart';
import 'package:pontifex_archive/features/search/data/repositories/search_repository.dart';
import 'package:pontifex_archive/features/search/domain/entities/search_result.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchProvider searchProvider;
  SearchRepositoryImpl(this.searchProvider);

  @override
  Future<bool> setup() async {
    return searchProvider.setup();
  }

  @override
  List<SearchResult> search(String text) {
    return searchProvider.search(text);
  }
}
