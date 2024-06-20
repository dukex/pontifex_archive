import 'package:flutter/material.dart';
import 'package:better_router/better_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/router.dart';
import 'package:pontifex_archive/src/core/application/blocs/language_bloc.dart';
import 'package:pontifex_archive/src/core/application/blocs/language_event.dart';
import 'package:pontifex_archive/src/core/application/blocs/language_state.dart';
import 'package:pontifex_archive/src/core/theme/material_theme.dart';
import 'package:pontifex_archive/src/core/theme/utils.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  runApp(TranslationProvider(child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>(
        create: (context) => LanguageBloc()..add(LoadLanguageEvent()),
        child: BlocConsumer<LanguageBloc, LanguageState>(
            listener: (context, state) {
          LocaleSettings.setLocale(state.locale!);
        }, builder: (context, state) {
          var bloc = context.read<LanguageBloc>();
          var state = bloc.state;

          if (state is LanguageLoaded) {
            final betterRoutes = BetterRouter(routes: routes);

            return MaterialApp(
                onGenerateTitle: (context) => context.t.app.title,
                localizationsDelegates: GlobalMaterialLocalizations.delegates,
                supportedLocales: AppLocaleUtils.supportedLocales,
                locale: TranslationProvider.of(context).flutterLocale,
                theme: _buildTheme(context),
                onGenerateRoute: betterRoutes.call);
          }

          return const SizedBox.shrink();
        }));
  }

  ThemeData _buildTheme(context) {
    TextTheme textTheme = createTextTheme(context, "Open Sans", "Ubuntu");

    final brightness = View.of(context).platformDispatcher.platformBrightness;

    MaterialTheme theme = MaterialTheme(textTheme);

    return brightness == Brightness.light ? theme.light() : theme.dark();
  }
}
