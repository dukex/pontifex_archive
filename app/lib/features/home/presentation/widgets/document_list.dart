import 'package:flutter/material.dart';
import 'package:pontifex_archive/core/domain/entities/document.dart';
import 'package:pontifex_archive/features/home/presentation/widgets/document_card.dart';

class DocumentList extends StatelessWidget {
  final List<DocumentEntity> documents;

  const DocumentList({super.key, required this.documents});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      padding: const EdgeInsets.only(bottom: 24),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      maxCrossAxisExtent: 150,
      mainAxisSpacing: 16,
      crossAxisSpacing: 6,
      childAspectRatio: 6 / 9,
      children: documents
          .map<DocumentCard>((document) => DocumentCard(document: document))
          .toList(),
    );
  }
}
