import 'package:epub_view/src/data/models/chapter_view_value.dart';
import 'package:epub_view/src/ui/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:pontifex_archive/src/features/reader/application/blocs/reader_state.dart';
import 'package:pontifex_archive/src/features/reader/presentation/widgets/reader_navigation_drawer.dart';

class ReaderChapters extends StatefulWidget {
  final EbookDownloaded state;
  const ReaderChapters({super.key, required this.state});

  @override
  State<ReaderChapters> createState() => _ReaderChaptersState();
}

class _ReaderChaptersState extends State<ReaderChapters> {
  int? currentChapter;

  @override
  void initState() {
    super.initState();

    widget.state.controller.loadingState.addListener(() {
      setState(() {});
    });

    widget.state.controller.currentValueListenable.addListener(() {
      setState(() {
        var chapterNumber = widget.state.controller.currentValue?.chapterNumber;
        if (currentChapter != chapterNumber) {
          currentChapter = chapterNumber;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReaderNavigationDrawer(state: widget.state);
  }
}
