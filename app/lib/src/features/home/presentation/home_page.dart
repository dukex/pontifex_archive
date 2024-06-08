import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_event.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_state.dart';
import 'package:pontifex_archive/src/features/home/data/providers/document_provider.dart';
import 'package:pontifex_archive/src/features/home/data/repositories/document_repository_impl.dart';
import 'package:pontifex_archive/src/features/home/domain/usecases/get_documents.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/document_list_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final documentProvider = DocumentProvider();
    final documentRepository = DocumentRepositoryImpl(documentProvider);
    final getDocuments = GetDocuments(documentRepository);

    return BlocProvider<DocumentsBloc>(
      create: (_) => DocumentsBloc(getDocuments),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.select((DocumentsBloc bloc) => bloc.state);
    print(state);

    if (state is DocumentsInitialState) {
      context.read<DocumentsBloc>().add(LoadDocumentsEvent());
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Papal Documents'),
        ),
        body: state.progressing
            ? Center(child: CircularProgressIndicator())
            : (state is DocumentsErrorState)
                ? Center(child: Text('Error: ${state.message}'))
                : (state is DocumentsLoadedState)
                    ? ListView.builder(
                        itemCount: state.documents.length,
                        itemBuilder: (context, index) {
                          return DocumentListItem(
                              document: state.documents[index]);
                        },
                      )
                    : Center(child: CircularProgressIndicator()));
  }
}
