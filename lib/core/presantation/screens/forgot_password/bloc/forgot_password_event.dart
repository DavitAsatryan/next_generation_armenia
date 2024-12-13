abstract class ForgotPasswordEvent {}

class ValidateForgotPassEmail extends ForgotPasswordEvent {
  final String email;
  ValidateForgotPassEmail({required this.email});
}

class ForgotPasswordClick extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordClick({required this.email});
}
