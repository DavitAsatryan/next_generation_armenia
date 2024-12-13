import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_in/bloc/sign_in_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_in/bloc/sign_in_state.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';
import 'package:next_generation_armenia/core/presantation/utilities/typography/text_theme.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/custom_widgets/custom_text_filed.dart';

class SignInWeb extends StatefulWidget {
  const SignInWeb({
    super.key,
    required this.state,
    required this.emailController,
    required this.passwordController,
  });

  final dynamic state;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  State<SignInWeb> createState() => _SignInWebState();
}

Timer? _debounce;
bool hidePassword = true;

class _SignInWebState extends BaseState<SignInWeb> {
  @override
  void dispose() {
    _debounce?.cancel();
    _debounce = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          string.sign_in,
          style: fonts.textLarge,
        ),
        Text(
          string.welcome_back,
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
              bottom: BorderSide(
                width: 0.5,
                color: colors.duskyBlueColor.withOpacity(0.50),
              ),
            ),
          ),
          child: Column(
            children: [
              CustomTextField(
                controller: widget.emailController,
                hint: string.email,
                labelStyle: TextStyle(color: colors.errorColor),
                labelText: widget.state is SignInValidationState &&
                        widget.state.email == ValidationEnum.invalid
                    ? string.email_is_not_correct
                    : widget.state is SignInValidationState &&
                            widget.state.email == ValidationEnum.empty
                        ? 'Email cannot be empty'
                        : null,
                borderColor: widget.state is SignInValidationState &&
                        (widget.state.email == ValidationEnum.invalid ||
                            widget.state.email == ValidationEnum.empty)
                    ? colors.errorColor
                    : null,
                onChanged: (value) {
                  if (_debounce?.isActive == true) _debounce?.cancel();
                  _debounce = Timer(
                    const Duration(milliseconds: 600),
                    () {
                      context.read<SignInBloc>().add(ValidateEmail());
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: widget.passwordController,
                isValidSuffixIcon: true,
                isPasswordField: true,
                hidePassword: hidePassword,
                togglePasswordVisibility: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                hint: string.password,
                labelStyle: TextStyle(color: colors.errorColor),
                labelText: widget.state is SignInValidationState &&
                        widget.state.password == ValidationEnum.empty
                    ? 'Password cannot be empty'
                    : null,
                borderColor: widget.state is SignInValidationState &&
                        (widget.state.password == ValidationEnum.invalid ||
                            widget.state.password == ValidationEnum.empty)
                    ? colors.errorColor
                    : null,
                onChanged: (value) {
                  if (_debounce?.isActive == true) _debounce?.cancel();
                  _debounce = Timer(
                    const Duration(milliseconds: 600),
                    () {
                      context.read<SignInBloc>().add(ValidatePassword());
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.go('/${AppRouting.forgotPassword}'),
                  child: Text(
                    string.forgot_password,
                    style: fonts.textRegular.copyWith(
                      color: colors.duskyBlueColor,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: colors.duskyBlueColor,
                    ),
                  ),
                ),
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
                  final email = widget.emailController.text.trim();
                  final password = widget.passwordController.text.trim();
                  context.read<SignInBloc>().add(SignIn(
                        email: email,
                        password: password,
                      ));
                },
                child: Text(
                  string.sign_in,
                  style: fonts.textRegular.copyWith(
                    color: colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Column(
          children: [
            Text(
              string.register_as_a,
              style: fonts.textRegular.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(10),
                      backgroundColor: colors.mainBackgroundColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: colors.duskyBlueColor,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => context.go('/${AppRouting.signUpTeacher}'),
                    child: Text(
                      string.teachers,
                      style: fonts.textRegular.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(10),
                      backgroundColor: colors.mainBackgroundColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: colors.duskyBlueColor,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => context.go('/${AppRouting.signUpDonor}'),
                    child: Text(
                      string.donors,
                      style: fonts.textRegular.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
