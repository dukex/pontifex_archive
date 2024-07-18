import 'package:pontifex_archive/i18n.g.dart';

abstract class LanguageState {
  AppLocale? locale;

  LanguageState(this.locale);
}

class LanguageLoading extends LanguageState {
  LanguageLoading() : super(null);
}

class LanguageLoaded extends LanguageState {
  LanguageLoaded(super.locale);
}
