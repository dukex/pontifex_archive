
import 'package:flutter_test/flutter_test.dart';

import '../../../mock_network_images_for.dart';

void main() {
  group("HomeView tests", () {
    testWidgets("test guidelines at initial state", (tester) async {
      mockNetworkImagesFor({
        Uri.parse("file:///home/duke/code/pontifex_archive/app/cover.png"):
            image500by500
      }, () async {
        // final SemanticsHandle handle = tester.ensureSemantics();
        // TestWidgetsFlutterBinding.ensureInitialized();

        // sl.registerFactory(() => SearchBloc(sl()));
        // sl.registerLazySingleton(
        //     () => Search(SearchRepositoryImpl(SearchWebProvider())));

        // await tester.pumpWidget(TranslationProvider(
        //     child: MaterialApp(
        //         theme: const MaterialTheme(TextTheme()).light(),
        //         home: Scaffold(
        //             body: HomeView(
        //           state: PopesLoadedState([
        //             PopeEntity(
        //               id: 'pope',
        //               name: 'Pope name',
        //               documents: [
        //                 DocumentEntity(
        //                     id: '13',
        //                     date: DateTime.now(),
        //                     name: 'Doc',
        //                     coverUrl: 'cover.png',
        //                     readingProgress: 15)
        //               ],
        //               translations: [],
        //               startDate: DateTime.now(),
        //             )
        //           ], [
        //             DocumentEntity(
        //                 id: '13',
        //                 date: DateTime.now(),
        //                 name: 'Doc',
        //                 coverUrl: 'cover.png',
        //                 readingProgress: 15)
        //           ]),
        //         )))));
        // await tester.pumpAndSettle();

        // await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        // await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
        // await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        // await expectLater(tester, meetsGuideline(textContrastGuideline));

        // handle.dispose();
      });
    });
  });
}
