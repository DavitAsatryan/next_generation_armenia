import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';

enum TabsEnum {
  teacher,
  donor,
  aboutUs,
  contactUs,
  blog;

  String title(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    switch (this) {
      case TabsEnum.teacher:
        return strings.teachers;
      case TabsEnum.donor:
        return strings.donors;
      case TabsEnum.aboutUs:
        return strings.about_us;
      case TabsEnum.contactUs:
        return strings.contact_us;
      case TabsEnum.blog:
        return strings.blog;
    }
  }

  String get page {
    switch (this) {
      case TabsEnum.teacher:
        return AppRouting.teacher;
      case TabsEnum.donor:
        return AppRouting.donor;
      case TabsEnum.aboutUs:
        return AppRouting.aboutUs;
      case TabsEnum.contactUs:
        return AppRouting.contactUs;
      case TabsEnum.blog:
        return AppRouting.blog;
    }
  }
}
