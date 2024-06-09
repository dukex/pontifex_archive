import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReaderPage extends StatelessWidget {
  final String id;

  ReaderPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var _epubController = EpubController(
      // Load document
      document: openUrl(
          "https://emersonalmeida.wtf/pontifex_archive/Franciscus/pt/enc-20150524-laudato_si.epub"),
      // Set start point
      epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    );

    return ReaderView(id: id, controller: _epubController);
  }

  static Future<EpubBook> openUrl(String documentUrl) async {
    final response = await http.get(Uri.parse(documentUrl));
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      return EpubReader.readBook(bytes);
    } else {
      throw Exception('Failed to load document from URL');
    }
  }
}

class ReaderView extends StatelessWidget {
  final String id;
  final EpubController controller;

  const ReaderView(
      {super.key, required this.id, required EpubController this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Show actual chapter name
        title: EpubViewActualChapter(
            controller: controller,
            builder: (chapterValue) => Text(
                  (chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ??
                      ''),
                  textAlign: TextAlign.start,
                )),
      ),

      drawer: Drawer(
        child: EpubViewTableOfContents(
          controller: controller,
        ),
      ),
      // Show epub document
      body: EpubView(
        controller: controller,
      ),
    );
  }
}
