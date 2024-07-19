import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/core/by_desc.dart';
import 'package:pontifex_archive/features/home/domain/entities/document.dart';
import 'package:pontifex_archive/features/home/domain/entities/pope.dart';
import 'package:pontifex_archive/features/home/domain/usecases/get_popes.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPopes getPopes;

  HomeBloc(this.getPopes) : super(HomeInitialState()) {
    on<LoadHomeEvent>(_onLoadDocuments);
  }

  Future<void> _onLoadDocuments(
    LoadHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final popes = await getPopes();
      emit(PopesLoadedState(popes, _readingDocuments(popes)));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  List<DocumentEntity> _readingDocuments(List<PopeEntity> popes) {
    List<DocumentEntity> documents = [];

    for (var pope in popes) {
      final documentsStarted = pope.documents
          .where((document) => document.readingStarted())
          .toList();

      documents.addAll(documentsStarted);
    }

    documents
        .sort(byDesc<DocumentEntity>((document) => document.readingProgress));

    return documents;
  }
}
