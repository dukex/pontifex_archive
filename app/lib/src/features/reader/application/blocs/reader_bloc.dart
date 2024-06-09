import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/features/reader/application/blocs/reader_event.dart';
import 'package:pontifex_archive/src/features/reader/application/blocs/reader_state.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/download_ebook.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/get_document.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReaderBloc extends Bloc<ReaderEvent, ReaderState> {
  final GetDocument getDocument;
  final DownloadEbook downloadEbook;

  ReaderBloc(this.getDocument, this.downloadEbook) : super(ReaderInitial()) {
    on<LoadDocumentEvent>(_onLoadDocument);
    on<LoadEbookEvent>(_onLoadEbook);
    on<SaveReadingPositionEvent>(_onSaveReadingPosition);
  }

  Future<void> _onLoadDocument(
      LoadDocumentEvent event, Emitter<ReaderState> emit) async {
    emit(ReaderLoading());

    try {
      final document = await getDocument(event.id);

      if (document == null) {
        emit(ReaderError('Failed to load document from URL'));
      } else {
        emit(DocumentLoaded(document));
      }
    } catch (e) {
      emit(ReaderError(e.toString()));
    }
  }

  Future<void> _onLoadEbook(
      LoadEbookEvent event, Emitter<ReaderState> emit) async {
    emit(ReaderLoading());

    try {
      final controller = await downloadEbook(event.document);

      if (controller == null) {
        emit(ReaderError('Failed to load document from URL'));
      } else {
        emit(EbookDownloaded(controller));
      }
    } catch (e) {
      emit(ReaderError(e.toString()));
    }
  }

  Future<void> _onSaveReadingPosition(
      SaveReadingPositionEvent event, Emitter<ReaderState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(event.documentUrl, event.cfi);
  }
}
