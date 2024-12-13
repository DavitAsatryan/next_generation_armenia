import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import 'package:next_generation_armenia/core/data/utilities/validation_utils.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgot_password/bloc/forgot_password_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgot_password/bloc/forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc()
      : super(ForgotPasswordValidationState(
          email: ValidationEnum.none,
        )) {
    on<ValidateForgotPassEmail>(_onValidateEmail);
    on<ForgotPasswordClick>(_onForgotPassword);
  }

  ValidationEnum emailValidation = ValidationEnum.none;

  void _onValidateEmail(
      ValidateForgotPassEmail event, Emitter<ForgotPasswordState> emit) {
    emailValidation = ValidationEnum.none;

    emit(
      ForgotPasswordValidationState(
        email: emailValidation,
      ),
    );
  }

  Future<void> _onForgotPassword(
      ForgotPasswordClick event, Emitter<ForgotPasswordState> emit) async {
    final isEmailValid = ValidationUtils.isValidEmail(event.email);

    if (!isEmailValid) {
      emailValidation = ValidationEnum.invalid;
    } else {
      emailValidation = ValidationEnum.valid;
    }

    if (event.email.isEmpty) {
      emailValidation = ValidationEnum.empty;
    }

    if (emailValidation != ValidationEnum.valid) {
      emit(
        ForgotPasswordValidationState(
          email: emailValidation,
        ),
      );
      return;
    }

    emit(ForgotPasswordLoadingState());

    emit(ForgotPasswordErrorState("error message"));
    emit(ForgotPasswordSuccessState('success'));
  }
}
