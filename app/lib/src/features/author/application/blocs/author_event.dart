abstract class AuthorEvent {}

class LoadAuthorEvent extends AuthorEvent {
  final String id;

  LoadAuthorEvent({required this.id});
}
