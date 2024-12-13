import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:next_generation_armenia/core/presantation/utilities/color/app_colors.dart';
import 'package:next_generation_armenia/core/presantation/utilities/color/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
abstract class BaseStatelessWidget extends StatelessWidget {
  BaseStatelessWidget({super.key});

  AppColors get colors => Theme.of(context).colorScheme.appColors;

  TextTheme get fonts => Theme.of(context).textTheme;

  AppLocalizations get string => AppLocalizations.of(context)!;

  Size get sizes => MediaQuery.of(context).size;

  bool get isMobile => MediaQuery.of(context).size.width < 700;

  late BuildContext context;

  Widget baseBuild(BuildContext context);

  @nonVirtual
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return baseBuild(context);
  }
}
