import 'package:pontifex_archive/src/features/author/data/models/author.dart';

abstract class AuthorRepository {
  Future<Author> getAuthor(String id);
}
