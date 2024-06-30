import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/src/features/search/application/blocs/search_bloc.dart';
import 'package:pontifex_archive/src/features/search/application/blocs/search_event.dart';
import 'package:pontifex_archive/src/features/search/application/blocs/search_state.dart';
import 'package:pontifex_archive/src/features/search/data/providers/search_sqlite_provider.dart';
import 'package:pontifex_archive/src/features/search/data/repositories/search_repository_impl.dart';
import 'package:pontifex_archive/src/features/search/domain/usercases/search.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchProvider = SearchSQLiteProvider();
    final searchRepository = SearchRepositoryImpl(searchProvider);
    final search = Search(searchRepository);

    return BlocProvider<SearchBloc>(
        create: (_) => SearchBloc(search)..add(CheckSearchDataEvent()),
        child:
            BlocConsumer<SearchBloc, SearchState>(listener: (context, state) {
          print(state);
        }, builder: (context, state) {
          if (state is SearchConnectedState) {
            return SearchAnchor(
                builder: (BuildContext context, SearchController controller) =>
                    const Icon(Icons.search),
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) async {
                  var searchSuggestions = search.doSearch(controller.text);

                  return searchSuggestions.results.map((result) {
                    return ListTile(
                      title: Text(result.title),
                      subtitle: Text(context.t.search.found(n: result.count)),
                      onTap: () {
                        controller.closeView("");
                        Navigator.pushNamed(context, "/reader/${result.id}");
                      },
                    );
                  });
                });
          }

          return const SizedBox();
        }));
  }
}
