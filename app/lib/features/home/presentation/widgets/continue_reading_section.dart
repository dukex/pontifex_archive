import 'package:flutter/material.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/core/by_desc.dart';
import 'package:pontifex_archive/core/domain/entities/document.dart';
import 'package:pontifex_archive/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/features/home/presentation/widgets/documents_section.dart';

class ContinueReadingSection extends StatelessWidget {
  final HomeState state;
  const ContinueReadingSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    List<DocumentEntity> documents = _documents();

    if (documents.isNotEmpty) {
      return Column(children: [
        DocumentsSection(
            name: context.t.home.continueReading.title, documents: documents),
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

  List<DocumentEntity> _documents() {
    List<DocumentEntity> documents = [];

    for (var pope in state.popes) {
      final documentsStarted = pope.documents
          .where((document) => document.readingStarted())
          .toList();

      documents.addAll(documentsStarted);
    }

    documents
        .sort(byDesc<DocumentEntity>((document) => document.readingProgress));

    return documents;
  }
}
