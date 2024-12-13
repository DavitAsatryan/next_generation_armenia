import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgot_password/bloc/forgot_password_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgot_password/bloc/forgot_password_state.dart';
import 'package:next_generation_armenia/core/presantation/utilities/typography/text_theme.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/custom_widgets/custom_text_filed.dart';

class ForgotPasswordWeb extends StatefulWidget {
  const ForgotPasswordWeb({
    super.key,
    required this.emailController,
    required this.state,
  });
  final TextEditingController emailController;
  final dynamic state;

  @override
  State<ForgotPasswordWeb> createState() => _ForgotPasswordWebState();
}

class _ForgotPasswordWebState extends BaseState<ForgotPasswordWeb> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(string.recover_password, style: fonts.textLarge),
        Text(
          string.please_enter_your_email,
          style: fonts.textRegular.copyWith(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
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
                        context.read<ForgotPasswordBloc>().add(
                              ValidateForgotPassEmail(email: value),
                            );
                      },
                    );
                  },
                  controller: widget.emailController,
                  hint: string.email,
                  labelStyle: TextStyle(color: colors.errorColor),
                  labelText: widget.state is ForgotPasswordValidationState &&
                          widget.state.email == ValidationEnum.invalid
                      ? string.email_is_not_correct
                      : widget.state is ForgotPasswordValidationState &&
                              widget.state.email == ValidationEnum.empty
                          ? 'Email cannot be empty'
                          : null,
                  borderColor: widget.state is ForgotPasswordValidationState &&
                          (widget.state.email == ValidationEnum.invalid ||
                              widget.state.email == ValidationEnum.empty)
                      ? colors.errorColor
                      : null,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
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
            context.read<ForgotPasswordBloc>().add(ForgotPasswordClick(
                  email: email,
                ));
          },
          child: Text(
            string.send,
            style: fonts.textRegular.copyWith(
              color: colors.mainBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
