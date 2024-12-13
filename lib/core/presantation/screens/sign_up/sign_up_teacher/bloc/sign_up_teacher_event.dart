abstract class SignUpTeacherEvent {
  const SignUpTeacherEvent();

  T when<T>({
    required T Function(String email) validateEmail,
    required T Function(String phoneNumber) validatePhoneNumber,
    required T Function(String password) validatePassword,
    required T Function(String confirmPassword, String password)
        validateConfirmPassword,
    required T Function(String email, String phoneNumber, String password,
            String confirmPassword)
        signUp,
  }) {
    if (this is ValidateEmail) {
      return validateEmail((this as ValidateEmail).email);
    } else if (this is ValidatePhoneNumber) {
      return validatePhoneNumber((this as ValidatePhoneNumber).phoneNumber);
    } else if (this is ValidatePassword) {
      return validatePassword((this as ValidatePassword).password);
    } else if (this is ValidateConfirmePassword) {
      final state = this as ValidateConfirmePassword;
      return validateConfirmPassword(state.confirmPassword, state.password);
    } else if (this is SignUp) {
      final state = this as SignUp;
      return signUp(state.email, state.phoneNumber, state.password,
          state.confirmPassword);
    }
    throw Exception("Invalid event");
  }
}

class ValidateName extends SignUpTeacherEvent {
  final String name;

  const ValidateName(this.name);
}

class ValidateLastName extends SignUpTeacherEvent {
  final String lastName;

  const ValidateLastName(this.lastName);
}

class ValidateEmail extends SignUpTeacherEvent {
  final String email;

  const ValidateEmail(this.email);
}

class ValidatePhoneNumber extends SignUpTeacherEvent {
  final String phoneNumber;

  const ValidatePhoneNumber(this.phoneNumber);
}

class ValidatePassword extends SignUpTeacherEvent {
  final String password;

  const ValidatePassword(this.password);
}

class ValidateRegion extends SignUpTeacherEvent {
  final String value;

  const ValidateRegion(this.value);
}

class ValidateCityVilage extends SignUpTeacherEvent {
  final String value;

  const ValidateCityVilage(this.value);
}

class ValidateSchool extends SignUpTeacherEvent {
  final String value;

  const ValidateSchool(this.value);
}

class ValidateSubject extends SignUpTeacherEvent {
  final String value;

  const ValidateSubject(this.value);
}

class ValidateGrade extends SignUpTeacherEvent {
  final String value;

  const ValidateGrade(this.value);
}

class ValidateConfirmePassword extends SignUpTeacherEvent {
  final String confirmPassword;
  final String password;

  const ValidateConfirmePassword(this.confirmPassword, this.password);
}

class SetPreferredStore extends SignUpTeacherEvent {
  const SetPreferredStore();
}

class SignUp extends SignUpTeacherEvent {
  final String name;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String region;
  final String cityVilage;
  final String school;
  final String subject;
  final String grade;
  final String password;
  final String confirmPassword;

  const SignUp({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.region,
    required this.cityVilage,
    required this.school,
    required this.subject,
    required this.grade,
    required this.password,
    required this.confirmPassword,
  });
}
