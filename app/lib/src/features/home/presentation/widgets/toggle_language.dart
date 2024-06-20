import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'package:pontifex_archive/src/core/application/blocs/language_bloc.dart';
import 'package:pontifex_archive/src/core/application/blocs/language_event.dart';

class ToggleLanguage extends StatelessWidget {
  const ToggleLanguage({super.key});

  @override
  Widget build(context) {
    return Column(children: [
      TextButton(
          child: const Text("Set locale to Pt"),
          onPressed: () => {
                BlocProvider.of<LanguageBloc>(context).add(
                  ToggleLanguageEvent(AppLocale.pt), // 0 - en, 1 - es
                )
              }),
      TextButton(
          child: const Text("Set locale to English"),
          onPressed: () => {
                BlocProvider.of<LanguageBloc>(context).add(
                  ToggleLanguageEvent(AppLocale.en), // 0 - en, 1 - es
                )
              }),
    ]);
  }
}
