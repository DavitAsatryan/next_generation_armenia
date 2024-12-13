import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ValidationEnum { none, valid, empty, notEmpty, invalid }

extension ValidationEnumExt on ValidationEnum {
  String? errorMessageFirstName(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_email;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? errorMessageLastName(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_email;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? errorMessage(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_email;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? errorMassagePassword(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_filed;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? errorMassageConfirmPassword(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.passwords_doesnt_match;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? errorMassageCurrentPassword(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_filed;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? errorMessageEmail(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_email;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? errorMassagePhoneNumber(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_phone_number;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }

  String? errorMessagePreferredStore(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    switch (this) {
      case ValidationEnum.valid:
        return null;
      case ValidationEnum.empty:
        return strings.field_is_required;
      case ValidationEnum.invalid:
        return strings.invalid_phone_number;
      case ValidationEnum.notEmpty:
        return null;
      case ValidationEnum.none:
        return null;
    }
  }
}
