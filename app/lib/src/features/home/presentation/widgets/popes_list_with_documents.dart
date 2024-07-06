import 'package:flutter/material.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/src/core/application/by_desc.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';
import 'package:pontifex_archive/src/core/domain/entities/pope.dart';
import 'package:pontifex_archive/src/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/document_list.dart';

class PopesListWithDocuments extends StatelessWidget {
  final HomeState state;
  const PopesListWithDocuments({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final popes = state.popes;
    popes.sort(byDesc<PopeEntity>((a) => a.startDate));

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: popes.map((pope) {
          final documents = pope.documents;
          documents.sort(byDesc<DocumentEntity>((document) => document.date));

          return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                    pope.nameLocale(LocaleSettings.currentLocale.flutterLocale),
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                DocumentList(documents: documents)
              ]);
        }).toList());
  }
}
