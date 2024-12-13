import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';

abstract class SignUpDonorState {
  const SignUpDonorState();
}

class SignUpDonorStateLoading extends SignUpDonorState {
  const SignUpDonorStateLoading();
}

class SignUpDonorStateSuccess extends SignUpDonorState {
  const SignUpDonorStateSuccess();
}

class SignUpDonorStateError extends SignUpDonorState {
  final String msg;

  const SignUpDonorStateError(this.msg);
}

class SignUpDonorStateLogout extends SignUpDonorState {
  final String msg;
  final String errorCode;

  const SignUpDonorStateLogout({required this.msg, required this.errorCode});
}

class SignUpDonorStateValidation extends SignUpDonorState {
  final ValidationEnum name;
  final ValidationEnum lastName;
  final ValidationEnum email;
  final ValidationEnum phoneNumber;
  final ValidationEnum region;
  final ValidationEnum city;
  final ValidationEnum country;
  final ValidationEnum confirmPassword;
  final ValidationEnum password;
  final bool isButtonActive;

  const SignUpDonorStateValidation({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.region,
    required this.city,
    required this.country,
    required this.confirmPassword,
    required this.password,
    required this.isButtonActive,
  });
}
