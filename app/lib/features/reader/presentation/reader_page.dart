import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/injection_container/sl.dart';
import 'package:pontifex_archive/features/reader/application/blocs/reader_bloc.dart';
import 'package:pontifex_archive/features/reader/application/blocs/reader_event.dart';
import 'package:pontifex_archive/features/reader/application/blocs/reader_state.dart';
import 'package:pontifex_archive/features/reader/presentation/widgets/reader_view.dart';

class ReaderPage extends StatelessWidget {
  final String id;

  const ReaderPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReaderBloc>(
        create: (context) => sl<ReaderBloc>()..add(LoadDocumentEvent(id)),
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
