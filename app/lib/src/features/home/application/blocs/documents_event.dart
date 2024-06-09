import 'package:pontifex_archive/src/features/home/domain/entities/document.dart';

abstract class DocumentsEvent {}

class LoadDocumentsEvent extends DocumentsEvent {}

class SelectDocumentEvent extends DocumentsEvent {
  final DocumentEntity document;

  SelectDocumentEvent(this.document);
}
