import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/features/search/domain/usecases/search.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Search search;

  SearchBloc(this.search) : super(SearchInitialState()) {
    on<CheckSearchDataEvent>(_onSearchSetup);
  }

  Future<void> _onSearchSetup(
    CheckSearchDataEvent event,
    Emitter<SearchState> emit,
  ) async {
    try {
      var finished = await search.setup();
      if (finished) {
        emit(SearchConnectedState(search: search));
      }
    } catch (e) {
      // OK
    }
  }
}
