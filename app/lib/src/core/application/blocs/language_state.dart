import 'package:flutter/material.dart';

abstract class LanguageState {
  Locale? locale;

  LanguageState(this.locale);
}

class LanguageLoading extends LanguageState {
  LanguageLoading() : super(null);
}

class LanguageLoaded extends LanguageState {
  LanguageLoaded(super.locale);
}
