import 'dart:ui';

abstract class LocaleEvent {}

class ChangeLocaleEvent extends LocaleEvent {
  final Locale newLocale;

  ChangeLocaleEvent(this.newLocale);
}
