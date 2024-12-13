import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordValidationState extends ForgotPasswordState {
  final ValidationEnum email;

  ForgotPasswordValidationState({
    required this.email,
  });
}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  final String? result;

  ForgotPasswordSuccessState(this.result);
}

class ForgotPasswordErrorState extends ForgotPasswordState {
  final String msg;

  ForgotPasswordErrorState(this.msg);
}
