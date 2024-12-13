abstract class ForgotPasswordCodeEvent {}

class ValidateForgotPassCode extends ForgotPasswordCodeEvent {
  final String code;
  ValidateForgotPassCode({required this.code});
}

class ValidateForgotCodeNewPassword extends ForgotPasswordCodeEvent {
  final String password;
  ValidateForgotCodeNewPassword({required this.password});
}

class ValidateForgotCodeConfirmPassword extends ForgotPasswordCodeEvent {
  final String confirmPassword;
  final String password;

  ValidateForgotCodeConfirmPassword(this.confirmPassword, this.password);
}

class ForgotPasswordCodeClick extends ForgotPasswordCodeEvent {
  final String code;
  final String confirmPassword;
  final String password;
  ForgotPasswordCodeClick({
    required this.code,
    required this.password,
    required this.confirmPassword,
  });
}
