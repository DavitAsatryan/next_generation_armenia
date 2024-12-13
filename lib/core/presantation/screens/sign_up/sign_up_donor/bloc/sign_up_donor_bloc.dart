import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import 'package:next_generation_armenia/core/data/utilities/validation_utils.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_donor/bloc/sign_up_donor_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_donor/bloc/sign_up_donor_state.dart';

class SignUpDonorBloc extends Bloc<SignUpDonorEvent, SignUpDonorState> {
  SignUpDonorBloc()
      : super(
          const SignUpDonorStateValidation(
            name: ValidationEnum.none,
            lastName: ValidationEnum.none,
            email: ValidationEnum.none,
            region: ValidationEnum.none,
            city: ValidationEnum.none,
            country: ValidationEnum.none,
            password: ValidationEnum.none,
            confirmPassword: ValidationEnum.none,
            phoneNumber: ValidationEnum.none,
            isButtonActive: false,
          ),
        ) {
    on<ValidateDonorName>(
      (event, emit) {
        nameValidation = ValidationEnum.none;
        emit(
          SignUpDonorStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            city: cityValidation ?? ValidationEnum.none,
            country: countryValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );

    on<ValidateDonorLastName>(
      (event, emit) {
        lastNameValidation = ValidationEnum.none;
        emit(
          SignUpDonorStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            city: cityValidation ?? ValidationEnum.none,
            country: countryValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );

    on<ValidateDonorEmail>(
      (event, emit) {
        emailValidation = ValidationEnum.none;
        emit(
          SignUpDonorStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            city: cityValidation ?? ValidationEnum.none,
            country: countryValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );

    on<ValidateDonorPhoneNumber>(
      (event, emit) {
        phoneNumberValidation = ValidationEnum.none;
        emit(
          SignUpDonorStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            city: cityValidation ?? ValidationEnum.none,
            country: countryValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );

    on<ValidateDonorPassword>(
      (event, emit) {
        passwordValidation = ValidationEnum.none;
        emit(
          SignUpDonorStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            city: cityValidation ?? ValidationEnum.none,
            country: countryValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );
    on<ValidateDonorRegion>(
      (event, emit) {
        regionValidation = ValidationEnum.none;
        emit(
          SignUpDonorStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            city: cityValidation ?? ValidationEnum.none,
            country: countryValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );

    on<ValidateDonorCity>(
      (event, emit) {
        cityValidation = ValidationEnum.none;
        emit(
          SignUpDonorStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            city: cityValidation ?? ValidationEnum.none,
            country: countryValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );

    on<ValidateDonorConfirmPassword>(
      (event, emit) {
        confirmPasswordValidation = ValidationEnum.none;
        emit(
          SignUpDonorStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            city: cityValidation ?? ValidationEnum.none,
            country: countryValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );

    on<SignUpDonor>(
      (event, emit) async {
        final isEmailValid = ValidationUtils.isValidEmail(event.email);
        final isPassword = ValidationUtils.isValidPassword(event.password);

        if (event.name.isEmpty) {
          nameValidation = ValidationEnum.empty;
        } else {
          nameValidation = ValidationEnum.valid;
        }
        if (event.lastName.isEmpty) {
          lastNameValidation = ValidationEnum.empty;
        } else {
          lastNameValidation = ValidationEnum.valid;
        }

        if (event.email.isEmpty) {
          emailValidation = ValidationEnum.empty;
        } else if (!isEmailValid) {
          emailValidation = ValidationEnum.invalid;
        } else {
          emailValidation = ValidationEnum.valid;
        }

        if (event.phoneNumber.isEmpty) {
          phoneNumberValidation = ValidationEnum.empty;
        } else if (event.phoneNumber.length != 8) {
          phoneNumberValidation = ValidationEnum.invalid;
        } else {
          phoneNumberValidation = ValidationEnum.valid;
        }
        if (event.region.isEmpty) {
          regionValidation = ValidationEnum.empty;
        } else {
          regionValidation = ValidationEnum.valid;
        }

        if (event.city.isEmpty) {
          cityValidation = ValidationEnum.empty;
        } else {
          cityValidation = ValidationEnum.valid;
        }

        if (event.country.isEmpty) {
          countryValidation = ValidationEnum.empty;
        } else {
          countryValidation = ValidationEnum.valid;
        }

        if (event.password.isEmpty) {
          passwordValidation = ValidationEnum.empty;
        } else if (!isPassword) {
          passwordValidation = ValidationEnum.invalid;
        } else {
          passwordValidation = ValidationEnum.valid;
        }

        if (event.confirmPassword.isEmpty) {
          confirmPasswordValidation = ValidationEnum.empty;
        } else if (event.password != event.confirmPassword) {
          confirmPasswordValidation = ValidationEnum.invalid;
        } else {
          confirmPasswordValidation = ValidationEnum.valid;
        }

        emit(
          SignUpDonorStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            city: cityValidation ?? ValidationEnum.none,
            country: countryValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
        if (nameValidation != ValidationEnum.valid ||
            lastNameValidation != ValidationEnum.valid ||
            emailValidation != ValidationEnum.valid ||
            phoneNumberValidation != ValidationEnum.valid ||
            passwordValidation != ValidationEnum.valid ||
            regionValidation != ValidationEnum.valid ||
            confirmPasswordValidation != ValidationEnum.valid ||
            cityValidation != ValidationEnum.valid ||
            countryValidation != ValidationEnum.valid) return;

        emit(const SignUpDonorStateLoading());
        emit(const SignUpDonorStateSuccess());
      },
    );
  }

  ValidationEnum? nameValidation;
  ValidationEnum? lastNameValidation;
  ValidationEnum? emailValidation;
  ValidationEnum? phoneNumberValidation;
  ValidationEnum? regionValidation;
  ValidationEnum? cityValidation;
  ValidationEnum? countryValidation;
  ValidationEnum? passwordValidation;
  ValidationEnum? confirmPasswordValidation;

  bool get isButtonActive =>
      (nameValidation == ValidationEnum.none ||
          nameValidation == ValidationEnum.valid) &&
      (lastNameValidation == ValidationEnum.none ||
          lastNameValidation == ValidationEnum.valid) &&
      (emailValidation == ValidationEnum.none ||
          emailValidation == ValidationEnum.valid) &&
      (phoneNumberValidation == ValidationEnum.none ||
          phoneNumberValidation == ValidationEnum.valid) &&
      (passwordValidation == ValidationEnum.none ||
          passwordValidation == ValidationEnum.valid) &&
      (confirmPasswordValidation == ValidationEnum.none ||
          confirmPasswordValidation == ValidationEnum.valid) &&
      (regionValidation == ValidationEnum.none ||
          regionValidation == ValidationEnum.valid) &&
      (cityValidation == ValidationEnum.none ||
          cityValidation == ValidationEnum.valid) &&
      (countryValidation == ValidationEnum.none ||
          countryValidation == ValidationEnum.valid);
}
