import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/features/home/domain/entities/document.dart';

class DocumentListItem extends StatelessWidget {
  final DocumentEntity document;

  DocumentListItem({required this.document});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(document.name),
      subtitle: Text('Pope: ${document.pope.name}'),
      onTap: () {
        // Implementar navegação para a página de leitura aqui
      },
    );
  }
}
