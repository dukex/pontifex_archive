import 'package:flutter/material.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/core/theme/media_utils.dart';
import 'package:pontifex_archive/features/reader/application/blocs/reader_state.dart';

class ReaderNavigationDrawer extends StatelessWidget {
  const ReaderNavigationDrawer({
    super.key,
    required this.state,
  });

  final EbookDownloaded state;

  @override
  Widget build(BuildContext context) {
    final tableOfContents = state.controller.tableOfContents();
    final selectedIndex =
        (state.controller.currentValue?.chapterNumber ?? 1) - 1;
    final u = MediaUtils.of(context);

    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (chapterIndex) {
        final chapter = tableOfContents[chapterIndex];

        state.controller.scrollTo(index: chapter.startIndex);
        if (!u.isLargeScreen) Navigator.of(context).pop();
      },
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(
              u.padding, u.padding, u.padding, u.padding / 2),
          child: Text(
            context.t.reader.navigation_drawer.chapters.title,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ...tableOfContents.map((chapter) {
          return NavigationDrawerDestination(
            label: Flexible(
                child: Text(
              chapter.title!,
              overflow: TextOverflow.ellipsis,
            )),
            icon: const Icon(Icons.circle_outlined),
            selectedIcon: const Icon(Icons.circle),
          );
        }),
      ],
    );
  }
}
