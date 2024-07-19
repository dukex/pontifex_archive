import 'package:better_router/better_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/router.dart';
import 'package:pontifex_archive/core/application/blocs/language_bloc.dart';
import 'package:pontifex_archive/core/application/blocs/language_event.dart';
import 'package:pontifex_archive/core/application/blocs/language_state.dart';
import 'package:pontifex_archive/core/theme/theme.dart';
import 'package:pontifex_archive/core/theme/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>(
        create: (context) => LanguageBloc()..add(LoadLanguageEvent()),
        child: BlocConsumer<LanguageBloc, LanguageState>(
            listener: (context, state) {
          if (state is LanguageLoaded) {
            LocaleSettings.setLocale(state.locale!);
          }
        }, builder: (context, state) {
          final bloc = context.read<LanguageBloc>();
          final state = bloc.state;

          if (state is LanguageLoaded) {
            final betterRoutes = BetterRouter(routes: routes);

            return MaterialApp(
                onGenerateTitle: (context) => context.t.app.title,
                localizationsDelegates: GlobalMaterialLocalizations.delegates,
                supportedLocales: AppLocaleUtils.supportedLocales,
                locale: LocaleSettings.currentLocale.flutterLocale,
                theme: _buildTheme(context),
                onGenerateRoute: betterRoutes.call);
          }

          return const SizedBox.shrink();
        }));
  }

  ThemeData _buildTheme(context) {
    TextTheme textTheme = createTextTheme(context, "Open Sans", "Open Sans");

    final brightness = View.of(context).platformDispatcher.platformBrightness;

    MaterialTheme theme = MaterialTheme(textTheme);

    return brightness == Brightness.light ? theme.light() : theme.dark();
  }
}
