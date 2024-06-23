import 'package:pontifex_archive/src/core/data/models/author.dart';
import 'package:pontifex_archive/src/features/author/data/providers/author_provider.dart';
import 'package:pontifex_archive/src/features/author/data/repositories/author_repository.dart';
import 'package:http/http.dart' as http;

class AuthorRepositoryImpl extends AuthorRepository {
  final AuthorProvider provider;

  AuthorRepositoryImpl(this.provider);

  @override
  Future<Author> getAuthor(String id) {
    return provider.getAuthor(http.Client(), id);
  }
}
