import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/src/features/reader/application/blocs/reader_state.dart';
import 'package:pontifex_archive/src/features/reader/presentation/widgets/reader_navigation_drawer.dart';

class ReaderView extends StatelessWidget {
  final EbookDownloaded state;

  const ReaderView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: EpubViewActualChapter(
            controller: state.controller,
            builder: (chapterValue) => Text(
                  (chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ??
                      ''),
                  textAlign: TextAlign.start,
                )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: context.t.reader.closeTooltip,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      drawer: ReaderNavigationDrawer(state: state),
      body: EpubView(
        controller: state.controller,
      ),
    );
  }
}
