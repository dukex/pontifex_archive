import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/features/reader/domain/entities/document.dart';
import 'package:pontifex_archive/features/reader/domain/usecases/save_reading_position.dart';
import 'package:pontifex_archive/features/reader/application/blocs/reader_event.dart';
import 'package:pontifex_archive/features/reader/application/blocs/reader_state.dart';
import 'package:pontifex_archive/features/reader/domain/usecases/download_ebook.dart';
import 'package:pontifex_archive/features/reader/domain/usecases/get_document.dart';

class ReaderBloc extends Bloc<ReaderEvent, ReaderState> {
  final GetDocument getDocument;
  final DownloadEbook downloadEbook;
  final SaveReadingPosition saveReadingPosition;

  ReaderBloc(this.getDocument, this.downloadEbook, this.saveReadingPosition)
      : super(ReaderInitial()) {
    on<LoadDocumentEvent>(_onLoadDocument);
    on<SaveReadingPositionEvent>(_onSaveReadingPosition);
  }

  Future<void> _onLoadDocument(
      LoadDocumentEvent event, Emitter<ReaderState> emit) async {
    emit(ReaderLoading());

    try {
      final document = await getDocument(event.id);

      if (document == null) {
        emit(const ReaderError('Failed to load document from URL'));
      } else {
        emit(DocumentLoaded(document));

        await _loadEbook(document, emit);
      }
    } catch (e) {
      emit(ReaderError(e.toString()));
    }
  }

  Future<void> _onSaveReadingPosition(
      SaveReadingPositionEvent event, Emitter<ReaderState> emit) async {
    try {
      await saveReadingPosition(event.document, event.cfi, event.progress);
    } catch (e) {
      // nothing
    }
  }

  Future<void> _loadEbook(
      DocumentEntity document, Emitter<ReaderState> emit) async {
    try {
      final controller = await downloadEbook(document);

      if (controller == null) {
        emit(const ReaderError('Failed to load document from URL'));
      } else {
        emit(EbookDownloaded(document, controller));
      }
    } catch (e) {
      emit(ReaderError(e.toString()));
    }
  }
}
