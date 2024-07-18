import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/features/search/data/providers/search_web_provider.dart';
import 'package:pontifex_archive/features/search/data/repositories/search_repository_impl.dart';
import 'package:pontifex_archive/injection_container/sl.dart';
import 'package:pontifex_archive/core/domain/entities/pope.dart';
import 'package:pontifex_archive/core/theme/theme.dart';
import 'package:pontifex_archive/features/home/application/blocs/home_state.dart';
import 'package:pontifex_archive/features/home/presentation/widgets/home_view.dart';
import 'package:pontifex_archive/features/search/application/blocs/search_bloc.dart';
import 'package:pontifex_archive/features/search/domain/usecases/search.dart';

void main() {
  group("HomeView tests", () {
    testWidgets("test guidelines at initial state", (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      TestWidgetsFlutterBinding.ensureInitialized();

      sl.registerFactory(() => SearchBloc(sl()));
      sl.registerLazySingleton(
          () => Search(SearchRepositoryImpl(SearchWebProvider())));

      await tester.pumpWidget(TranslationProvider(
          child: MaterialApp(
              theme: const MaterialTheme(TextTheme()).light(),
              home: Scaffold(
                  body: HomeView(
                state: PopesLoadedState([
                  PopeEntity(
                      id: '',
                      name: 'Pope name',
                      motto: '',
                      country: '',
                      documents: [],
                      translations: [],
                      startDate: DateTime.now(),
                      imageUrl: '')
                ]),
              )))));
      await tester.pumpAndSettle();

      await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
      await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
      await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
      await expectLater(tester, meetsGuideline(textContrastGuideline));

      handle.dispose();
    });
  });
}
