import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/core/application/by_desc.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/documents_section.dart';

class ContinueReadingSection extends StatelessWidget {
  final HomeState state;
  const ContinueReadingSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    List<DocumentEntity> documents = _documents();

    if (documents.isNotEmpty) {
      return DocumentsSection(name: "Continue reading", documents: documents);
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

    documents.sort(
        byDesc<DocumentEntity, double>((document) => document.readingProgress));

    return documents;
  }
}
