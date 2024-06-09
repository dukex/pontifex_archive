import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/document_modal.dart';

class DocumentListItem extends StatelessWidget {
  final DocumentEntity document;

  const DocumentListItem({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(document.name),
      subtitle: Text('Pope: ${document.pope.name}'),
      onTap: () {
        showDocumentModal(context, document);
      },
    );
  }
}
