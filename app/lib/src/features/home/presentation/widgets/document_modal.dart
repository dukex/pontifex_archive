import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_bloc.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/documents_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';

void showDocumentModal(BuildContext context, DocumentEntity document) {
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
              Navigator.pushNamed(context, "/reader/${document.id}");
            },
          ),
        ],
      );
    },
  );
}
