import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/core/domain/entities/document.dart';

class DocumentCard extends StatelessWidget {
  final DocumentEntity document;

  const DocumentCard({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/reader/${document.id}");
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
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                document.date.year.toString(),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontStyle: FontStyle.italic),
              )),
          const Spacer()
        ]),
      ),
    );
  }
}
