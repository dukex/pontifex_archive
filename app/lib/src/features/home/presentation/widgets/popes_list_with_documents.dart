import 'package:flutter/material.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/src/core/application/by_desc.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';
import 'package:pontifex_archive/src/core/domain/entities/pope.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/documents_section.dart';

class PopesListWithDocuments extends StatelessWidget {
  final HomeState state;
  const PopesListWithDocuments({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final popes = state.popes;
    popes.sort(byDesc<PopeEntity, DateTime>((a) => a.startDate));

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: popes.map((pope) {
          final documents = pope.documents;
          documents.sort(
              byDesc<DocumentEntity, DateTime>((document) => document.date));

          return DocumentsSection(
              name: pope.nameLocale(LocaleSettings.currentLocale.flutterLocale),
              documents: documents);
        }).toList());
  }
}
