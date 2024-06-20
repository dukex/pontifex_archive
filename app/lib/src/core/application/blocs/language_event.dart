import 'package:flutter/material.dart';
import 'package:pontifex_archive/i18n.g.dart';

abstract class LanguageEvent {}

class LoadLanguageEvent extends LanguageEvent {
  LoadLanguageEvent();
}

class ToggleLanguageEvent extends LanguageEvent {
  final AppLocale locale;

  ToggleLanguageEvent(this.locale);
}
