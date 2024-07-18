import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/core/application/blocs/language_bloc.dart';
import 'package:pontifex_archive/core/application/blocs/language_event.dart';
import 'package:pontifex_archive/core/application/blocs/language_state.dart';

void main() {
  group(LanguageBloc, () {
    late LanguageBloc bloc;

    setUp(() {
      bloc = LanguageBloc();
    });

    test('initial state is loading', () {
      expect(bloc.state, isInstanceOf<LanguageLoading>());
    });

    blocTest(
      'emits LanguageLoaded with locale en when LoadLanguageEvent is added',
      build: () => bloc,
      act: (b) => b.add(LoadLanguageEvent()),
      expect: () => [isA<LanguageLoaded>()],
      verify: (bloc) {
        expect(bloc.state.locale, AppLocale.en);
      },
    );

    blocTest(
      'emits LanguageLoading and LanguageLoaded with selected locale when ChangeLanguageEvent is added',
      build: () => bloc,
      act: (b) => b.add(ChangeLanguageEvent(AppLocale.pt)),
      expect: () => [isA<LanguageLoading>(), isA<LanguageLoaded>()],
      verify: (bloc) {
        expect(bloc.state.locale, AppLocale.pt);
      },
    );
  });
}
