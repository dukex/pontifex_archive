import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/document_modal.dart';

class DocumentListItem extends StatelessWidget {
  final DocumentEntity document;

  const DocumentListItem({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          showDocumentModal(context, document);
        },
        child: Column(children: [
          SizedBox(
            child: Image.network(
              document.coverUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          document.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        )),
                    const Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text("Alo", overflow: TextOverflow.ellipsis)),
                  ]))
        ]),
      ),
    );
  }
}
