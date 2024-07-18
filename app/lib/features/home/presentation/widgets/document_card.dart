import 'package:flutter/material.dart';
import 'package:pontifex_archive/core/domain/entities/document.dart';

class DocumentCard extends StatefulWidget {
  final DocumentEntity document;

  const DocumentCard({super.key, required this.document});

  @override
  State<DocumentCard> createState() => _DocumentCardState();
}

class _DocumentCardState extends State<DocumentCard> {
  late double readingProgress;

  @override
  void initState() {
    super.initState();

    readingProgress = widget.document.readingProgress;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () async {
          final newReadingProgress = await Navigator.pushNamed(
              context, "/reader/${widget.document.id}");

          setState(() {
            readingProgress = newReadingProgress as double;
          });
        },
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            child: Image.network(
              widget.document.coverUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                widget.document.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              )),
          Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.document.date.year.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
                  if (readingProgress > 0)
                    Text(
                      "${readingProgress.ceil().toString()}%",
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                ],
              )),
          const Spacer()
        ]),
      ),
    );
  }
}
