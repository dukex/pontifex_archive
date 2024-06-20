import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/features/author/domain/usecases/get_author.dart';
import 'author_event.dart';
import 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final GetAuthor getAuthor;

  AuthorBloc(this.getAuthor) : super(AuthorInitialState()) {
    on<LoadAuthorEvent>(_onLoadDocuments);
  }

  Future<void> _onLoadDocuments(
    LoadAuthorEvent event,
    Emitter<AuthorState> emit,
  ) async {
    try {
      final author = await getAuthor(event.id);
      emit(AuthorLoadedState(author));
    } catch (e) {
      emit(AuthorErrorState(e.toString()));
    }
  }
}
