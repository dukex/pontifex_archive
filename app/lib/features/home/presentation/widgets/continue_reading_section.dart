import 'package:flutter/material.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/features/home/domain/entities/document.dart';
import 'package:pontifex_archive/features/home/presentation/widgets/documents_section.dart';

class ContinueReadingSection extends StatelessWidget {
  final List<DocumentEntity> readingDocuments;
  const ContinueReadingSection({super.key, required this.readingDocuments});

  @override
  Widget build(BuildContext context) {
    if (readingDocuments.isNotEmpty) {
      return Column(children: [
        DocumentsSection(
            name: context.t.home.continueReading.title,
            documents: readingDocuments),
        Container(
          margin: const EdgeInsets.only(bottom: 25),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.secondary))),
        ),
      ]);
    }

    return const SizedBox();
  }
}
