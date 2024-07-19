import 'package:flutter/material.dart';

class ChapterTitle extends StatelessWidget {
  final dynamic chapterValue;

  const ChapterTitle(this.chapterValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      (chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? ''),
      textAlign: TextAlign.start,
    );
  }
}
