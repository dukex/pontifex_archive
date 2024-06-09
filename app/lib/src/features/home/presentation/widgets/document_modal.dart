import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/features/home/domain/entities/document.dart';

void showDocumentModal(BuildContext context, DocumentEntity document) {
  final selectDocument =
      () => context.read<DocumentsBloc>().add(SelectDocumentEvent(document));

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(document.name),
        content: Text(
            'Do you want to read this document by Pope ${document.pope.name}?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Read'),
            onPressed: () {
              selectDocument();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
