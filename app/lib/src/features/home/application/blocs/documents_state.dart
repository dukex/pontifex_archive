import 'package:pontifex_archive/src/features/home/domain/entities/document.dart';

abstract class DocumentsState {
  final bool progressing;
  DocumentsState(this.progressing);
}

class DocumentsInitialState extends DocumentsState {
  DocumentsInitialState() : super(true);
}

class DocumentsLoadingState extends DocumentsState {
  DocumentsLoadingState() : super(true);
}

class DocumentsLoadedState extends DocumentsState {
  final List<DocumentEntity> documents;

  DocumentsLoadedState(this.documents) : super(false);
}

class DocumentsErrorState extends DocumentsState {
  final String message;

  DocumentsErrorState(this.message) : super(false);
}

class DocumentSelectedState extends DocumentsState {
  final DocumentEntity document;

  DocumentSelectedState(this.document) : super(false);
}
