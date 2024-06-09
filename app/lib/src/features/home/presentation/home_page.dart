import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_event.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_state.dart';
import 'package:pontifex_archive/src/core/data/providers/document_provider.dart';
import 'package:pontifex_archive/src/core/data/repositories/document_repository_impl.dart';
import 'package:pontifex_archive/src/features/home/domain/usecases/get_documents.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/document_list_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final documentProvider = DocumentProvider();
    final documentRepository = DocumentRepositoryImpl(documentProvider);
    final getDocuments = GetDocuments(documentRepository);

    return BlocProvider<DocumentsBloc>(
      create: (_) => DocumentsBloc(getDocuments)..add(LoadDocumentsEvent()),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Papal Documents'),
        ),
        body: BlocConsumer<DocumentsBloc, DocumentsState>(
            listener: (context, state) {
          print(state);
        }, builder: (context, state) {
          if (state.progressing) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DocumentsLoadedState) {
            return ListView.builder(
              itemCount: state.documents.length,
              itemBuilder: (context, index) {
                return DocumentListItem(document: state.documents[index]);
              },
            );
          } else if (state is DocumentsErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            print("NO STAGE");
            print(state);
            return const Center(child: Text('Error: no state'));
          }
        }));
  }
}
