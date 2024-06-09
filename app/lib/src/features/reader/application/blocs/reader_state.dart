import 'package:epub_view/epub_view.dart';
import 'package:equatable/equatable.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';

abstract class ReaderState extends Equatable {
  const ReaderState();

  @override
  List<Object> get props => [];
}

class ReaderInitial extends ReaderState {}

class ReaderLoading extends ReaderState {}

class DocumentLoaded extends ReaderState {
  final DocumentEntity document;
  const DocumentLoaded(this.document);
}

class EbookDownloaded extends ReaderState {
  final DocumentEntity document;
  final EpubController controller;
  const EbookDownloaded(this.document, this.controller);
}

class ReaderError extends ReaderState {
  final String message;
  const ReaderError(this.message);
}
