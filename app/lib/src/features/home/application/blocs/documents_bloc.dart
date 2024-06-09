import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/features/home/domain/usecases/get_documents.dart';
import 'documents_event.dart';
import 'documents_state.dart';

class DocumentsBloc extends Bloc<DocumentsEvent, DocumentsState> {
  final GetDocuments getDocuments;

  DocumentsBloc(this.getDocuments) : super(DocumentsInitialState()) {
    on<LoadDocumentsEvent>(_onLoadDocuments);
  }

  Future<void> _onLoadDocuments(
    LoadDocumentsEvent event,
    Emitter<DocumentsState> emit,
  ) async {
    emit(DocumentsLoadingState());
    try {
      final documents = await getDocuments();
      emit(DocumentsLoadedState(documents));
    } catch (e) {
      emit(DocumentsErrorState(e.toString()));
    }
  }
}
