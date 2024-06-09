import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_event.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_state.dart';
import 'package:pontifex_archive/src/core/data/providers/document_provider.dart';
import 'package:pontifex_archive/src/core/data/repositories/document_repository_impl.dart';
import 'package:pontifex_archive/src/features/home/domain/usecases/get_documents.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/document_list_item.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/home_view.dart';

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
          appBar: AppBar(
              title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Papal Documents',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Easily access and read papal documents',
                style: TextStyle(fontSize: 16),
              ),
            ],
          )),
          body: BlocConsumer<DocumentsBloc, DocumentsState>(
              listener: (context, state) {
            print(state);
          }, builder: (context, state) {
            if (state.progressing) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is DocumentsLoadedState) {
              return HomeView(state: state);
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
