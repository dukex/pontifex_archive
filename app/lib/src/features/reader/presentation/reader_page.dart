import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/core/data/providers/document_provider.dart';
import 'package:pontifex_archive/src/core/data/providers/preferences_provider.dart';
import 'package:pontifex_archive/src/core/data/repositories/document_repository_impl.dart';
import 'package:pontifex_archive/src/core/data/repositories/preferences_repository_impl.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/save_reading_position.dart';
import 'package:pontifex_archive/src/features/reader/application/blocs/reader_bloc.dart';
import 'package:pontifex_archive/src/features/reader/application/blocs/reader_event.dart';
import 'package:pontifex_archive/src/features/reader/application/blocs/reader_state.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/download_ebook.dart';
import 'package:pontifex_archive/src/features/reader/domain/usecases/get_document.dart';
import 'package:pontifex_archive/src/features/reader/presentation/widgets/reader_view.dart';

class ReaderPage extends StatelessWidget {
  final String id;

  const ReaderPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final documentProvider = DocumentProvider();
    final preferencesProvider = PreferencesProvider();

    final documentRepository = DocumentRepositoryImpl(documentProvider);
    final preferencesRepository =
        PreferencesRepositoryImpl(preferencesProvider);

    final getDocument = GetDocument(documentRepository);
    final downloadEbook =
        DownloadEbook(documentRepository, preferencesRepository);
    final saveReadingPosition = SaveReadingPosition(preferencesRepository);

    return BlocProvider<ReaderBloc>(
        create: (context) =>
            ReaderBloc(getDocument, downloadEbook, saveReadingPosition)
              ..add(LoadDocumentEvent(id)),
        child:
            BlocConsumer<ReaderBloc, ReaderState>(listener: (context, state) {
          if (state is EbookDownloaded) {
            state.controller.currentValueListenable.addListener(() {
              context.read<ReaderBloc>().add(SaveReadingPositionEvent(
                  state.document,
                  state.controller.generateEpubCfi(),
                  state.controller.currentValue?.progress));
            });
          }
        }, builder: (context, state) {
          if (state is ReaderLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReaderError) {
            return Center(child: Text(state.message));
          } else if (state is EbookDownloaded) {
            return ReaderView(state: state);
          } else if (state is DocumentLoaded) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text("No state to $state"));
          }
        }));
  }
}
