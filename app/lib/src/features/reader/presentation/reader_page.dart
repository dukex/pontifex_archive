import 'package:epub_view/epub_view.dart';
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
      child: const ReaderView(),
    );
  }
}

class ReaderView extends StatelessWidget {
  const ReaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReaderBloc, ReaderState>(listener: (context, state) {
      if (state is DocumentLoaded) {
        context.read<ReaderBloc>().add(LoadEbookEvent(state.document));
      }

      if (state is EbookDownloaded) {
        state.controller.currentValueListenable.addListener(() {
          context.read<ReaderBloc>().add(SaveReadingPositionEvent(
              state.document, state.controller.generateEpubCfi()));
        });
      }
    }, builder: (context, state) {
      if (state is ReaderLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is ReaderError) {
        return Center(child: Text(state.message));
      }

      if (state is EbookDownloaded) {
        return Scaffold(
          appBar: AppBar(
            // Show actual chapter name
            title: EpubViewActualChapter(
                controller: state.controller,
                builder: (chapterValue) => Text(
                      (chapterValue?.chapter?.Title
                              ?.replaceAll('\n', '')
                              .trim() ??
                          ''),
                      textAlign: TextAlign.start,
                    )),
          ),
          drawer: NavigationDrawer(
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  state.document.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.arrow_back),
                title: const Text('Back'),
                onTap: () {
                  Navigator.of(context).pop(); // Fechar o drawer
                  Navigator.of(context).pop(); // Voltar para a página anterior
                },
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.paddingOf(context).top + 160.0 + 1.0),
                child: EpubViewTableOfContents(
                  controller: state.controller,
                ),
              )
            ],
          ),
          body: EpubView(
            controller: state.controller,
          ),
        );
      }

      print("PAGE");
      print(state);

      return const Center(child: CircularProgressIndicator());
    });
  }
}
