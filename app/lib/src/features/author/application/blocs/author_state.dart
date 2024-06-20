import 'package:pontifex_archive/src/features/author/domain/entities/author_entity.dart';

abstract class AuthorState {
  final bool loading;
  final bool completed;

  AuthorState(this.loading, this.completed);
}

class AuthorInitialState extends AuthorState {
  AuthorInitialState() : super(true, false);
}

class AuthorLoadedState extends AuthorState {
  AuthorEntity author;

  AuthorLoadedState(this.author) : super(false, true);
}

class AuthorErrorState extends AuthorState {
  final String message;
  AuthorErrorState(this.message) : super(false, true);
}
