import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pontifex_archive/features/reader/domain/entities/document.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/features/reader/application/blocs/reader_state.dart';
import 'package:pontifex_archive/features/reader/presentation/widgets/reader_view.dart';
import 'package:pontifex_archive/features/search/data/providers/search_web_provider.dart';
import 'package:pontifex_archive/features/search/data/repositories/search_repository_impl.dart';
import 'package:pontifex_archive/injection_container/sl.dart';
import 'package:pontifex_archive/core/theme/theme.dart';
import 'package:pontifex_archive/features/search/application/blocs/search_bloc.dart';
import 'package:pontifex_archive/features/search/domain/usecases/search.dart';

void main() {
  group("ReaderView tests", () {
    testWidgets("test guidelines at initial state", (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      TestWidgetsFlutterBinding.ensureInitialized();

      sl.registerFactory(() => SearchBloc(sl()));
      sl.registerLazySingleton(
          () => Search(SearchRepositoryImpl(SearchWebProvider())));

      epubbook() async {
        EpubBook book = EpubBook();
        EpubChapter chapter = EpubChapter();
        chapter.Title = "Test";
        chapter.SubChapters = [];
        book.Chapters = [chapter];

        return book;
      }

      final document = epubbook();

      final controller = EpubController(document: document);

      await tester.pumpWidget(TranslationProvider(
          child: MaterialApp(
              theme: const MaterialTheme(TextTheme()).light(),
              home: ReaderView(
                  state: EbookDownloaded(
                      DocumentEntity(id: '', translations: []), controller)))));

      await tester.pump();
      await tester.pump();

      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      await expectLater(tester, meetsGuideline(textContrastGuideline));

      handle.dispose();
    });
  });
}
