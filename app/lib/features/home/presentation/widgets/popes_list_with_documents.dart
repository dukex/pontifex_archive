import 'package:flutter/material.dart';
import 'package:pontifex_archive/features/home/domain/entities/pope.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/features/home/presentation/widgets/documents_section.dart';

class PopesListWithDocuments extends StatelessWidget {
  final List<PopeEntity> popes;
  const PopesListWithDocuments({super.key, required this.popes});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: popes.map((pope) {
          final documents = pope.documents;

          return DocumentsSection(
              name: pope.nameLocale(LocaleSettings.currentLocale.flutterLocale),
              documents: documents);
        }).toList());
  }
}
