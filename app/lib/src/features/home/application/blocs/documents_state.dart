import 'package:pontifex_archive/src/core/domain/entities/document.dart';

abstract class DocumentsState {
  final bool progressing;
  final List<DocumentEntity> documents;

  DocumentsState(this.progressing, this.documents);
}

class DocumentsInitialState extends DocumentsState {
  DocumentsInitialState() : super(true, []);
}

class DocumentsLoadingState extends DocumentsState {
  DocumentsLoadingState() : super(true, []);
}

class DocumentsLoadedState extends DocumentsState {
  DocumentsLoadedState(documents) : super(false, documents);
}

class DocumentsErrorState extends DocumentsState {
  final String message;

  DocumentsErrorState(this.message) : super(false, []);
}
