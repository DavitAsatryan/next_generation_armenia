import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:next_generation_armenia/core/presantation/utilities/bloc/locale_bloc/locale_bloc.dart';
import 'package:next_generation_armenia/core/presantation/utilities/bloc/locale_bloc/locale_state.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_app_bar/bloc/tabs_bloc.dart';
import 'package:next_generation_armenia/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Application extends StatefulWidget {
  const Application({
    super.key,
  });
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  List<LocalizationsDelegate> localizationsDelegates = const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TabsBloc()),
        BlocProvider(create: (_) => LocaleBloc()),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return SafeArea(
            child: MaterialApp.router(
              routerConfig: AppRouting.router,
              supportedLocales: L10n.all,
              locale: state.locale,
              localizationsDelegates: localizationsDelegates,
            ),
          );
        },
      ),
    );
  }
}
