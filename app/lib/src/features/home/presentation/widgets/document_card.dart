import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';
import 'package:pontifex_archive/src/features/home/presentation/widgets/document_modal.dart';

class DocumentCard extends StatelessWidget {
  final DocumentEntity document;

  const DocumentCard({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          showDocumentModal(context, document);
        },
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            child: Image.network(
              document.coverUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                document.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              )),
          const Spacer()
        ]),
      ),
    );
  }
}
