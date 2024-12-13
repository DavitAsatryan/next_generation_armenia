import 'package:flutter/material.dart';
import 'package:next_generation_armenia/core/presantation/utilities/color/app_colors.dart';
import 'package:next_generation_armenia/core/presantation/utilities/color/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  AppColors get colors => Theme.of(context).colorScheme.appColors;

  TextTheme get fonts => Theme.of(context).textTheme;

  Size get sizes => MediaQuery.of(context).size;

  AppLocalizations get string => AppLocalizations.of(context)!;

  bool get isMobile => MediaQuery.of(context).size.width < 700;
}
