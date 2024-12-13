import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';

abstract class SignUpTeacherState {
  const SignUpTeacherState();
}

class SignUpStateLoading extends SignUpTeacherState {
  const SignUpStateLoading();
}

class SignUpStateSuccess extends SignUpTeacherState {
  const SignUpStateSuccess();
}

class SignUpStateError extends SignUpTeacherState {
  final String msg;

  const SignUpStateError(this.msg);
}

class SignUpStateLogout extends SignUpTeacherState {
  final String msg;
  final String errorCode;

  const SignUpStateLogout({required this.msg, required this.errorCode});
}

class SignUpStateValidation extends SignUpTeacherState {
  final ValidationEnum name;
  final ValidationEnum lastName;
  final ValidationEnum email;
  final ValidationEnum phoneNumber;
  final ValidationEnum region;
  final ValidationEnum cityVilage;
  final ValidationEnum school;
  final ValidationEnum subject;
  final ValidationEnum grage;
  final ValidationEnum confirmPassword;
  final ValidationEnum password;
  final bool isButtonActive;

  const SignUpStateValidation({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.region,
    required this.cityVilage,
    required this.school,
    required this.subject,
    required this.grage,
    required this.confirmPassword,
    required this.password,
    required this.isButtonActive,
  });
}
