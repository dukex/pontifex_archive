import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/injection_container.dart';
import 'package:pontifex_archive/src/core/theme/media_utils.dart';
import 'package:pontifex_archive/src/features/search/application/blocs/search_bloc.dart';
import 'package:pontifex_archive/src/features/search/application/blocs/search_event.dart';
import 'package:pontifex_archive/src/features/search/application/blocs/search_state.dart';
import 'package:pontifex_archive/src/features/search/domain/usecases/search.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final search = sl<Search>();

    return BlocProvider<SearchBloc>(
        create: (_) => sl<SearchBloc>()..add(CheckSearchDataEvent()),
        child:
            BlocConsumer<SearchBloc, SearchState>(listener: (context, state) {
          //OK
        }, builder: (context, state) {
          if (state is SearchConnectedState) {
            return SearchAnchor(
                builder: (BuildContext context, SearchController controller) =>
                    const Icon(Icons.search),
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) async {
                  final searchSuggestions = search.doSearch(controller.text);
                  final u = MediaUtils.of(context);

                  return [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: u.padding, horizontal: u.padding),
                      child: Text(controller.text.isNotEmpty
                          ? context.t.search.title(n: searchSuggestions.length)
                          : context.t.search.defaultTitle),
                    ),
                    ...searchSuggestions.map((result) {
                      return ListTile(
                        title: Text(result.title),
                        subtitle: Text(context.t.search.found(n: result.count)),
                        onTap: () {
                          controller.closeView("");
                          Navigator.pushNamed(context, "/reader/${result.id}");
                        },
                      );
                    })
                  ];
                });
          }

          return const SizedBox();
        }));
  }
}
