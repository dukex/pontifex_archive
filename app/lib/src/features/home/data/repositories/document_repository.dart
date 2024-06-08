import 'package:pontifex_archive/src/core/models/models.dart';

abstract class DocumentRepository {
  Future<List<Document>> getDocuments();
}
