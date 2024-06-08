import 'package:pontifex_archive/src/core/models/models.dart';
import 'package:pontifex_archive/src/features/home/data/providers/document_provider.dart';
import 'document_repository.dart';

class DocumentRepositoryImpl implements DocumentRepository {
  final DocumentProvider provider;

  DocumentRepositoryImpl(this.provider);

  @override
  Future<List<Document>> getDocuments() {
    return provider.fetchDocuments();
  }
}
