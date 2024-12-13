import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/presantation/utilities/bloc/locale_bloc/locale_event.dart';
import 'package:next_generation_armenia/core/presantation/utilities/bloc/locale_bloc/locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState(Locale('en'))) {
    on<ChangeLocaleEvent>((event, emit) {
      if (event.newLocale != state.locale) {
        emit(LocaleState(event.newLocale));
      }
    });
  }
}
