import 'package:equatable/equatable.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';

abstract class ReaderEvent extends Equatable {
  const ReaderEvent();

  @override
  List<Object> get props => [];
}

class LoadDocumentEvent extends ReaderEvent {
  final String id;

  const LoadDocumentEvent(this.id);

  @override
  List<Object> get props => [id];
}

class LoadEbookEvent extends ReaderEvent {
  final DocumentEntity document;
  const LoadEbookEvent(this.document);
}

class SaveReadingPositionEvent extends ReaderEvent {
  final String documentUrl;
  final String cfi;

  const SaveReadingPositionEvent(this.documentUrl, this.cfi);

  @override
  List<Object> get props => [documentUrl, cfi];
}
