import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import 'package:next_generation_armenia/core/data/utilities/validation_utils.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgort_password_code/bloc/forgot_password_code_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgort_password_code/bloc/forgot_password_code_state.dart';

class ForgotPasswordCodeBloc
    extends Bloc<ForgotPasswordCodeEvent, ForgotPasswordCodeState> {
  ForgotPasswordCodeBloc()
      : super(ForgotPasswordCodeValidationState(
          code: ValidationEnum.none,
          password: ValidationEnum.none,
          confirmPassword: ValidationEnum.none,
        )) {
    on<ValidateForgotPassCode>(_onValidateCode);

    on<ValidateForgotCodeNewPassword>(_onValidatNewPass);
    on<ValidateForgotCodeConfirmPassword>(_onValidatConfirmPass);

    on<ForgotPasswordCodeClick>(_onForgotPasswordCode);
  }

  ValidationEnum codeValidation = ValidationEnum.none;
  ValidationEnum newPassValidation = ValidationEnum.none;
  ValidationEnum confirmPassValidation = ValidationEnum.none;

  void _onValidateCode(
      ValidateForgotPassCode event, Emitter<ForgotPasswordCodeState> emit) {
    codeValidation = ValidationEnum.none;

    emit(
      ForgotPasswordCodeValidationState(
        code: codeValidation,
        password: newPassValidation,
        confirmPassword: confirmPassValidation,
      ),
    );
  }

  void _onValidatNewPass(ValidateForgotCodeNewPassword event,
      Emitter<ForgotPasswordCodeState> emit) {
    newPassValidation = ValidationEnum.none;

    emit(
      ForgotPasswordCodeValidationState(
        code: codeValidation,
        password: newPassValidation,
        confirmPassword: confirmPassValidation,
      ),
    );
  }

  void _onValidatConfirmPass(ValidateForgotCodeConfirmPassword event,
      Emitter<ForgotPasswordCodeState> emit) {
    confirmPassValidation = ValidationEnum.none;

    emit(
      ForgotPasswordCodeValidationState(
        code: codeValidation,
        password: newPassValidation,
        confirmPassword: confirmPassValidation,
      ),
    );
  }

  Future<void> _onForgotPasswordCode(ForgotPasswordCodeClick event,
      Emitter<ForgotPasswordCodeState> emit) async {
    final isPassword = ValidationUtils.isValidPassword(event.password);
    if (event.code.isEmpty) {
      codeValidation = ValidationEnum.invalid;
    } else {
      codeValidation = ValidationEnum.valid;
    }

    if (event.password.isEmpty) {
      newPassValidation = ValidationEnum.empty;
    } else if (!isPassword) {
      newPassValidation = ValidationEnum.invalid;
    } else {
      newPassValidation = ValidationEnum.valid;
    }

    if (event.confirmPassword.isEmpty) {
      confirmPassValidation = ValidationEnum.empty;
    } else if (event.password != event.confirmPassword) {
      confirmPassValidation = ValidationEnum.invalid;
    } else {
      confirmPassValidation = ValidationEnum.valid;
    }
    if (event.code.isEmpty) {
      codeValidation = ValidationEnum.empty;
    }

    if (codeValidation != ValidationEnum.valid ||
        newPassValidation != ValidationEnum.valid ||
        confirmPassValidation != ValidationEnum.valid) {
      emit(
        ForgotPasswordCodeValidationState(
          code: codeValidation,
          password: newPassValidation,
          confirmPassword: confirmPassValidation,
        ),
      );
      return;
    }

    emit(ForgotPasswordCodeLoadingState());

    emit(ForgotPasswordCodeErrorState("error message"));
    emit(ForgotPasswordCodeSuccessState('success'));
  }
}
