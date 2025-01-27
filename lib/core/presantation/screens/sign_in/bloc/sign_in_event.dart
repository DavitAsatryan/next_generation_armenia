abstract class SignInEvent {}

class ValidateEmail extends SignInEvent {}

class ValidatePassword extends SignInEvent {}

class SignIn extends SignInEvent {
  final String email;
  final String password;

  SignIn({required this.email, required this.password});
}
