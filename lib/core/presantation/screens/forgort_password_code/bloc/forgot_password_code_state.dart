import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';

abstract class ForgotPasswordCodeState {}

class ForgotPasswordCodeValidationState extends ForgotPasswordCodeState {
  final ValidationEnum code;
  final ValidationEnum password;
  final ValidationEnum confirmPassword;

  ForgotPasswordCodeValidationState({
    required this.code,
    required this.password,
    required this.confirmPassword,
  });
}

class ForgotPasswordCodeLoadingState extends ForgotPasswordCodeState {}

class ForgotPasswordCodeSuccessState extends ForgotPasswordCodeState {
  final String? result;

  ForgotPasswordCodeSuccessState(this.result);
}

class ForgotPasswordCodeErrorState extends ForgotPasswordCodeState {
  final String msg;

  ForgotPasswordCodeErrorState(this.msg);
}
