import 'package:flutter/material.dart';

abstract class LanguageEvent {}

class LoadLanguageEvent extends LanguageEvent {
  LoadLanguageEvent();
}

class ToggleLanguageEvent extends LanguageEvent {
  final Locale locale;

  ToggleLanguageEvent(this.locale);
}
