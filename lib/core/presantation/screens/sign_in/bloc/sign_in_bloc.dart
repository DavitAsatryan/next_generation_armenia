import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import 'package:next_generation_armenia/core/data/models/user_model.dart';
import 'package:next_generation_armenia/core/data/utilities/validation_utils.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_in/bloc/sign_in_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc()
      : super(SignInValidationState(
          email: ValidationEnum.none,
          password: ValidationEnum.none,
        )) {
    on<ValidateEmail>(_onValidateEmail);
    on<ValidatePassword>(_onValidatePassword);
    on<SignIn>(_onSignIn);
  }

  ValidationEnum emailValidation = ValidationEnum.none;
  ValidationEnum passwordValidation = ValidationEnum.none;

  void _onValidateEmail(ValidateEmail event, Emitter<SignInState> emit) {
    emailValidation = ValidationEnum.none;

    emit(
      SignInValidationState(
        email: emailValidation,
        password: passwordValidation,
      ),
    );
  }

  void _onValidatePassword(ValidatePassword event, Emitter<SignInState> emit) {
    passwordValidation = ValidationEnum.none;

    emit(
      SignInValidationState(
        email: emailValidation,
        password: passwordValidation,
      ),
    );
  }

  Future<void> _onSignIn(SignIn event, Emitter<SignInState> emit) async {
    final isEmailValid = ValidationUtils.isValidEmail(event.email);

    if (!isEmailValid) {
      emailValidation = ValidationEnum.invalid;
    } else {
      emailValidation = ValidationEnum.valid;
    }

    if (event.email.isEmpty) {
      emailValidation = ValidationEnum.empty;
    }

    if (event.password.isEmpty) {
      passwordValidation = ValidationEnum.empty;
    }

    if (emailValidation != ValidationEnum.valid ||
        passwordValidation != ValidationEnum.none) {
      emit(
        SignInValidationState(
          email: emailValidation,
          password: passwordValidation,
        ),
      );
      return;
    }

    emit(SignInLoadingState());

    emit(SignInErrorState("error message"));

    emit(
      SignInSuccessState(
        UserModel(email: event.email, name: "User name"),
      ),
    );
  }
}
