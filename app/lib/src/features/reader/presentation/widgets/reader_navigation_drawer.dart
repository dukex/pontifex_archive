import 'package:flutter/material.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/src/features/reader/application/blocs/reader_state.dart';

class ReaderNavigationDrawer extends StatelessWidget {
  const ReaderNavigationDrawer({
    super.key,
    required this.state,
  });

  final EbookDownloaded state;

  @override
  Widget build(BuildContext context) {
    final tableOfContents = state.controller.tableOfContents();

    return NavigationDrawer(
      selectedIndex: state.controller.currentValue?.chapterNumber,
      onDestinationSelected: (chapterIndex) {
        final chapter = tableOfContents[chapterIndex];

        state.controller.scrollTo(index: chapter.startIndex);
        Navigator.of(context).pop();
      },
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            context.t.reader.navigation_drawer.chapters.title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...tableOfContents.map((chapter) {
          return NavigationDrawerDestination(
            label: Text(chapter.title!),
            icon: const Icon(Icons.circle_outlined),
            selectedIcon: const Icon(Icons.circle),
          );
        }),
      ],
    );
  }
}
