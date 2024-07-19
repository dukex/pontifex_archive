import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:pontifex_archive/features/home/domain/entities/document.dart';
import 'package:pontifex_archive/features/home/domain/entities/pope.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/features/search/data/providers/search_web_provider.dart';
import 'package:pontifex_archive/features/search/data/repositories/search_repository_impl.dart';
import 'package:pontifex_archive/injection_container/sl.dart';
import 'package:pontifex_archive/core/theme/theme.dart';
import 'package:pontifex_archive/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/features/home/presentation/widgets/home_view.dart';
import 'package:pontifex_archive/features/search/application/blocs/search_bloc.dart';
import 'package:pontifex_archive/features/search/domain/usecases/search.dart';

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
