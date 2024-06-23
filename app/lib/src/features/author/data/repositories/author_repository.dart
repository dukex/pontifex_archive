import 'package:pontifex_archive/src/core/data/models/author.dart';

abstract class AuthorRepository {
  Future<Author> getAuthor(String id);
}
