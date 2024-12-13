import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import '../bloc/forgot_password_code_bloc.dart';
import '../bloc/forgot_password_code_event.dart';
import '../bloc/forgot_password_code_state.dart';
import 'package:next_generation_armenia/core/presantation/utilities/typography/text_theme.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/custom_widgets/custom_text_filed.dart';

class ForgotPasswordCodeMobile extends StatefulWidget {
  const ForgotPasswordCodeMobile({
    super.key,
    required this.recoveryController,
    required this.passwordController,
    required this.confirmePasswordController,
    required this.state,
  });
  final TextEditingController recoveryController;
  final TextEditingController passwordController;
  final TextEditingController confirmePasswordController;
  final dynamic state;

  @override
  State<ForgotPasswordCodeMobile> createState() =>
      _ForgotPasswordCodeMobileState();
}

class _ForgotPasswordCodeMobileState
    extends BaseState<ForgotPasswordCodeMobile> {
  Timer? _debounce;
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          string.recover_password,
          style: fonts.textLarge.copyWith(fontSize: 28),
        ),
        Text(
          string.please_enter_your_email,
          style: fonts.textRegular.copyWith(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 0.5,
                color: colors.duskyBlueColor.withOpacity(0.50),
              ),
            ),
          ),
          child: Column(
            children: [
              CustomTextField(
                onChanged: (value) {
                  if (_debounce?.isActive == true) {
                    _debounce?.cancel();
                  }
                  _debounce = Timer(
                    const Duration(milliseconds: 600),
                    () {
                      context.read<ForgotPasswordCodeBloc>().add(
                            ValidateForgotPassCode(code: value),
                          );
                    },
                  );
                },
                controller: widget.recoveryController,
                hint: string.recovery_code,
                labelStyle: TextStyle(color: colors.errorColor),
                labelText: widget.state is ForgotPasswordCodeValidationState &&
                        widget.state.code == ValidationEnum.invalid
                    ? 'invalid code'
                    : widget.state is ForgotPasswordCodeValidationState &&
                            widget.state.code == ValidationEnum.empty
                        ? 'code cannot be empty'
                        : null,
                borderColor:
                    widget.state is ForgotPasswordCodeValidationState &&
                            (widget.state.code == ValidationEnum.invalid ||
                                widget.state.code == ValidationEnum.empty)
                        ? colors.errorColor
                        : null,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    string.resend_code,
                    style: fonts.textRegular.copyWith(
                      color: colors.duskyBlueColor,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: colors.duskyBlueColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomTextField(
          isValidSuffixIcon: true,
          isPasswordField: true,
          hidePassword: hidePassword,
          togglePasswordVisibility: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          controller: widget.passwordController,
          hint: string.new_password,
          labelStyle: TextStyle(color: colors.errorColor),
          labelText: widget.state is ForgotPasswordCodeValidationState &&
                  widget.state.password == ValidationEnum.invalid
              ? string.invalid_filed
              : widget.state is ForgotPasswordCodeValidationState &&
                      widget.state.password == ValidationEnum.empty
                  ? 'Password cannot be empty'
                  : null,
          borderColor: widget.state is ForgotPasswordCodeValidationState &&
                  (widget.state.password == ValidationEnum.invalid ||
                      widget.state.password == ValidationEnum.empty)
              ? colors.errorColor
              : null,
          onChanged: (value) {
            if (_debounce?.isActive == true) _debounce?.cancel();
            _debounce = Timer(
              const Duration(milliseconds: 600),
              () {
                context.read<ForgotPasswordCodeBloc>().add(
                      ValidateForgotCodeNewPassword(password: value),
                    );
              },
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          isValidSuffixIcon: true,
          isPasswordField: true,
          hidePassword: hideConfirmPassword,
          togglePasswordVisibility: () {
            setState(() {
              hideConfirmPassword = !hideConfirmPassword;
            });
          },
          controller: widget.confirmePasswordController,
          hint: string.confirm_password,
          labelStyle: TextStyle(color: colors.errorColor),
          labelText: widget.state is ForgotPasswordCodeValidationState &&
                  widget.state.confirmPassword == ValidationEnum.invalid
              ? string.passwords_doesnt_match
              : widget.state is ForgotPasswordCodeValidationState &&
                      widget.state.confirmPassword == ValidationEnum.empty
                  ? 'Confirm password cannot be empty'
                  : null,
          borderColor: widget.state is ForgotPasswordCodeValidationState &&
                  (widget.state.confirmPassword == ValidationEnum.invalid ||
                      widget.state.confirmPassword == ValidationEnum.empty)
              ? colors.errorColor
              : null,
          onChanged: (value) {
            if (_debounce?.isActive == true) _debounce?.cancel();
            _debounce = Timer(
              const Duration(milliseconds: 600),
              () {
                context.read<ForgotPasswordCodeBloc>().add(
                      ValidateForgotCodeConfirmPassword(
                          value, widget.passwordController.text.trim()),
                    );
              },
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            elevation: 0,
            padding: const EdgeInsets.all(10),
            backgroundColor: colors.greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            final code = widget.recoveryController.text.trim();
            context.read<ForgotPasswordCodeBloc>().add(ForgotPasswordCodeClick(
                  code: code,
                  password: widget.passwordController.text.trim(),
                  confirmPassword:
                      widget.confirmePasswordController.text.trim(),
                ));
          },
          child: Text(
            string.done,
            style: fonts.textRegular.copyWith(
              color: colors.mainBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
