import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_event.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_state.dart';
import 'package:pontifex_archive/src/core/data/providers/document_provider.dart';
import 'package:pontifex_archive/src/core/data/repositories/document_repository_impl.dart';
import 'package:pontifex_archive/src/features/home/domain/usecases/get_documents.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final documentProvider = DocumentProvider();
    final documentRepository = DocumentRepositoryImpl(documentProvider);
    final getDocuments = GetDocuments(documentRepository);

    return BlocProvider<DocumentsBloc>(
      create: (_) => DocumentsBloc(getDocuments)..add(LoadDocumentsEvent()),
      child: Scaffold(
          body: BlocConsumer<DocumentsBloc, DocumentsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state.progressing) {
                  // TODO: loading screen
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is DocumentsLoadedState) {
                  return SafeArea(
                      minimum: EdgeInsets.all(10),
                      child: HomeScreen(state: state));
                } else if (state is DocumentsErrorState) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  print("NO STAGE");
                  print(state);
                  return const Center(child: Text('Error: no state'));
                }
              })),
    );
  }
}
