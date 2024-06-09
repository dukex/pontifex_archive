import 'package:flutter/material.dart';
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
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Read'),
            onPressed: () {
              Navigator.pushNamed(context, "/reader/${document.id}");
            },
          ),
        ],
      );
    },
  );
}
