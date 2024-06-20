import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pontifex_archive/i18n.g.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoading()) {
    on<LoadLanguageEvent>(_onLoadLanguage);
    on<ToggleLanguageEvent>(_onToggleLanguage);
  }

  Future<void> _onLoadLanguage(
    LoadLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    // TODO: fetch user preferences
    emit(LanguageLoaded(AppLocale.pt));
    sleep(const Duration(seconds: 3));
    emit(LanguageLoaded(AppLocale.en));
  }

  Future<void> _onToggleLanguage(
    ToggleLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    emit(LanguageLoading());
    emit(LanguageLoaded(event.locale));
  }
}
