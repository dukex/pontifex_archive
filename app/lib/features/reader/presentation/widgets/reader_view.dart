import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:pontifex_archive/features/reader/presentation/widgets/chapter_title.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/core/theme/media_utils.dart';
import 'package:pontifex_archive/features/reader/application/blocs/reader_state.dart';
import 'package:pontifex_archive/features/reader/presentation/widgets/reader_chapters.dart';
import 'package:pontifex_archive/features/reader/presentation/widgets/reader_navigation_drawer.dart';

class ReaderView extends StatelessWidget {
  final EbookDownloaded state;

  const ReaderView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final u = MediaUtils.of(context);

    return Scaffold(
        appBar: AppBar(
          title: EpubViewActualChapter(
              controller: state.controller,
              builder: (chapterValue) => ChapterTitle(chapterValue)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              tooltip: context.t.reader.closeTooltip,
              onPressed: () {
                Navigator.of(context)
                    .pop(state.controller.currentValue?.progress);
              },
            )
          ],
        ),
        drawer: u.isLargeScreen ? null : ReaderNavigationDrawer(state: state),
        body: Row(children: [
          if (u.isLargeScreen) ReaderChapters(state: state),
          if (u.isLargeScreen)
            SizedBox(
              width: u.padding,
            ),
          Expanded(
              child: SelectionArea(
            child: EpubView(
              controller: state.controller,
              builders: EpubViewBuilders<DefaultBuilderOptions>(
                  chapterDividerBuilder: _chapterDividerBuilder(context),
                  options: const DefaultBuilderOptions()),
            ),
          )),
          if (u.isLargeScreen)
            SizedBox(
              width: u.padding,
            ),
        ]));
  }

  _chapterDividerBuilder(BuildContext context) {
    final theme = Theme.of(context);
    final u = MediaUtils.of(context);

    return (EpubChapter chapter) {
      return Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(width: 1, color: theme.colorScheme.secondary),
        )),
        width: double.infinity,
        padding: EdgeInsets.only(
            top: u.padding * 2,
            left: u.padding,
            right: u.padding,
            bottom: u.padding),
        child: Text(
          chapter.Title ?? '',
          style: theme.textTheme.headlineLarge,
        ),
      );
    };
  }
}
