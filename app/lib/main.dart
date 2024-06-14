import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:better_router/better_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Bloc.observer = const AppBlocObserver();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>(
        create: (context) => LanguageBloc()..add(LoadLanguageEvent()),
        child: BlocConsumer<LanguageBloc, LanguageState>(
            listener: (context, state) {},
            builder: (context, state) {
              var bloc = context.read<LanguageBloc>();
              var state = bloc.state;

              if (state is LanguageLoaded) {
                final betterRoutes = BetterRouter(routes: routes);

                return MaterialApp(
                    onGenerateTitle: (context) =>
                        AppLocalizations.of(context)!.title,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: state.locale,
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
