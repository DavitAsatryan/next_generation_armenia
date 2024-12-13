abstract class SignUpDonorEvent {
  const SignUpDonorEvent();
}

class ValidateDonorName extends SignUpDonorEvent {
  final String name;

  const ValidateDonorName(this.name);
}

class ValidateDonorLastName extends SignUpDonorEvent {
  final String lastName;

  const ValidateDonorLastName(this.lastName);
}

class ValidateDonorEmail extends SignUpDonorEvent {
  final String email;

  const ValidateDonorEmail(this.email);
}

class ValidateDonorPhoneNumber extends SignUpDonorEvent {
  final String phoneNumber;

  const ValidateDonorPhoneNumber(this.phoneNumber);
}

class ValidateDonorPassword extends SignUpDonorEvent {
  final String password;

  const ValidateDonorPassword(this.password);
}

class ValidateDonorRegion extends SignUpDonorEvent {
  final String value;

  const ValidateDonorRegion(this.value);
}

class ValidateDonorCity extends SignUpDonorEvent {
  final String value;

  const ValidateDonorCity(this.value);
}

class ValidateDonorConfirmPassword extends SignUpDonorEvent {
  final String confirmPassword;
  final String password;

  const ValidateDonorConfirmPassword(this.confirmPassword, this.password);
}

class SetPreferredStore extends SignUpDonorEvent {
  const SetPreferredStore();
}

class SignUpDonor extends SignUpDonorEvent {
  final String name;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String region;
  final String city;
  final String country;
  final String password;
  final String confirmPassword;

  const SignUpDonor({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.region,
    required this.city,
    required this.country,
    required this.password,
    required this.confirmPassword,
  });
}
