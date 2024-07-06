import 'package:pontifex_archive/src/features/search/domain/usecases/search.dart';

abstract class SearchState {
  final bool exists;

  SearchState(this.exists);
}

class SearchInitialState extends SearchState {
  SearchInitialState() : super(false);
}

class SearchConnectedState extends SearchState {
  final Search search;

  SearchConnectedState({required this.search}) : super(true);
}
