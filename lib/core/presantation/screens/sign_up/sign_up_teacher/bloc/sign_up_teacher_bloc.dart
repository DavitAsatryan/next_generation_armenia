import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import 'package:next_generation_armenia/core/data/utilities/validation_utils.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/bloc/sign_up_teacher_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/bloc/sign_up_teacher_state.dart';

class SignUpTeacherBloc extends Bloc<SignUpTeacherEvent, SignUpTeacherState> {
  SignUpTeacherBloc()
      : super(
          const SignUpStateValidation(
            name: ValidationEnum.none,
            lastName: ValidationEnum.none,
            email: ValidationEnum.none,
            region: ValidationEnum.none,
            cityVilage: ValidationEnum.none,
            school: ValidationEnum.none,
            subject: ValidationEnum.none,
            grage: ValidationEnum.none,
            password: ValidationEnum.none,
            confirmPassword: ValidationEnum.none,
            phoneNumber: ValidationEnum.none,
            isButtonActive: false,
          ),
        ) {
    on<ValidateName>(
      (event, emit) {
        nameValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: false,
          ),
        );
      },
    );

    on<ValidateLastName>(
      (event, emit) {
        lastNameValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: false,
          ),
        );
      },
    );

    on<ValidateEmail>(
      (event, emit) {
        emailValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: false,
          ),
        );
      },
    );

    on<ValidatePhoneNumber>(
      (event, emit) {
        phoneNumberValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );

    on<ValidatePassword>(
      (event, emit) {
        passwordValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );
    on<ValidateRegion>(
      (event, emit) {
        regionValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );

    on<ValidateCityVilage>(
      (event, emit) {
        cityVilageValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );
    on<ValidateSchool>(
      (event, emit) {
        schoolValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );
    on<ValidateSubject>(
      (event, emit) {
        subjectValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );
    on<ValidateGrade>(
      (event, emit) {
        gradeValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );
    on<ValidateConfirmePassword>(
      (event, emit) {
        confirmPasswordValidation = ValidationEnum.none;
        emit(
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            confirmPassword: confirmPasswordValidation ?? ValidationEnum.none,
            phoneNumber: phoneNumberValidation ?? ValidationEnum.none,
            isButtonActive: isButtonActive,
          ),
        );
      },
    );

    on<SignUp>(
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

        if (event.cityVilage.isEmpty) {
          cityVilageValidation = ValidationEnum.empty;
        } else {
          cityVilageValidation = ValidationEnum.valid;
        }

        if (event.school.isEmpty) {
          schoolValidation = ValidationEnum.empty;
        } else {
          schoolValidation = ValidationEnum.valid;
        }

        if (event.subject.isEmpty) {
          subjectValidation = ValidationEnum.empty;
        } else {
          subjectValidation = ValidationEnum.valid;
        }
        if (event.grade.isEmpty) {
          gradeValidation = ValidationEnum.empty;
        } else {
          gradeValidation = ValidationEnum.valid;
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
          SignUpStateValidation(
            name: nameValidation ?? ValidationEnum.none,
            lastName: lastNameValidation ?? ValidationEnum.none,
            email: emailValidation ?? ValidationEnum.none,
            password: passwordValidation ?? ValidationEnum.none,
            region: regionValidation ?? ValidationEnum.none,
            cityVilage: cityVilageValidation ?? ValidationEnum.none,
            school: schoolValidation ?? ValidationEnum.none,
            subject: subjectValidation ?? ValidationEnum.none,
            grage: gradeValidation ?? ValidationEnum.none,
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
            cityVilageValidation != ValidationEnum.valid ||
            schoolValidation != ValidationEnum.valid ||
            subjectValidation != ValidationEnum.valid ||
            gradeValidation != ValidationEnum.valid) return;

        emit(const SignUpStateLoading());
        emit(const SignUpStateSuccess());
      },
    );
  }

  ValidationEnum? nameValidation;
  ValidationEnum? lastNameValidation;
  ValidationEnum? emailValidation;
  ValidationEnum? phoneNumberValidation;
  ValidationEnum? regionValidation;
  ValidationEnum? cityVilageValidation;
  ValidationEnum? schoolValidation;
  ValidationEnum? subjectValidation;
  ValidationEnum? gradeValidation;
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
      (cityVilageValidation == ValidationEnum.none ||
          cityVilageValidation == ValidationEnum.valid) &&
      (schoolValidation == ValidationEnum.none ||
          schoolValidation == ValidationEnum.valid) &&
      (subjectValidation == ValidationEnum.none ||
          subjectValidation == ValidationEnum.valid) &&
      (gradeValidation == ValidationEnum.none ||
          gradeValidation == ValidationEnum.valid);
}
