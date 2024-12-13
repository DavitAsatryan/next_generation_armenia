import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import 'package:next_generation_armenia/core/data/models/user_model.dart';

abstract class SignInState {}

class SignInValidationState extends SignInState {
  final ValidationEnum email;
  final ValidationEnum password;

  SignInValidationState({
    required this.email,
    required this.password,
  });
}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final UserModel? user;

  SignInSuccessState(this.user);
}

class SignInErrorState extends SignInState {
  final String msg;

  SignInErrorState(this.msg);
}
