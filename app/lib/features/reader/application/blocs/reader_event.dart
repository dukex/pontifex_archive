import 'package:equatable/equatable.dart';
import 'package:pontifex_archive/core/domain/entities/document.dart';

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

class SaveReadingPositionEvent extends ReaderEvent {
  final DocumentEntity document;
  final String? cfi;
  final double? progress;

  const SaveReadingPositionEvent(this.document, this.cfi, this.progress);
}
