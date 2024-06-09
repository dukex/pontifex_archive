import 'package:flutter/material.dart';
import 'package:better_router/better_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/router.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print("change");
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print(transition);
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
    final betterRoutes = BetterRouter(routes: routes);
    final ThemeData theme = ThemeData();

    return MaterialApp(
        title: 'Papal Documents Reader',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              secondary: const Color(0xFFF5F5F5),
              primary: const Color(0xFF003366)),
          primaryColor: const Color(0xFF003366),
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF003366), // Fundo azul escuro
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          textTheme: const TextTheme(
            headlineMedium: TextStyle(
              color: Color(0xFF003366), // Azul escuro
              fontWeight: FontWeight.bold,
            ),
            headlineLarge: TextStyle(
              color: Color(0xFF666666), // Cinza escuro
            ),
            bodyMedium: TextStyle(
              color: Colors.black87,
            ),
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
          ),
        ),
        onGenerateRoute: betterRoutes.call);
  }
}
