import 'package:flutter/material.dart';
import 'package:pontifex_archive/core/domain/entities/document.dart';
import 'package:pontifex_archive/features/home/presentation/widgets/document_list.dart';

class DocumentsSection extends StatelessWidget {
  const DocumentsSection({
    super.key,
    required this.documents,
    required this.name,
  });

  final String name;
  final List<DocumentEntity> documents;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(name,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      DocumentList(documents: documents)
    ]);
  }
}
