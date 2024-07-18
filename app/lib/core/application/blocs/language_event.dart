import 'package:pontifex_archive/i18n.g.dart';

abstract class LanguageEvent {}

class LoadLanguageEvent extends LanguageEvent {
  LoadLanguageEvent();
}

class ChangeLanguageEvent extends LanguageEvent {
  final AppLocale locale;

  ChangeLanguageEvent(this.locale);
}
