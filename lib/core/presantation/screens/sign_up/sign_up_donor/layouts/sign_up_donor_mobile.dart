import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import 'package:next_generation_armenia/core/data/utilities/validation_utils.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/bloc/sign_up_teacher_state.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_donor/bloc/sign_up_donor_bloc.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_donor/bloc/sign_up_donor_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_donor/bloc/sign_up_donor_state.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';
import 'package:next_generation_armenia/core/presantation/utilities/typography/text_theme.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/custom_widgets/custom_drop_down.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/custom_widgets/custom_text_filed.dart';

class SignUpDonorMobile extends StatefulWidget {
  const SignUpDonorMobile({
    super.key,
    required this.state,
    required this.nameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
  });
  final dynamic state;

  final TextEditingController nameController;

  final TextEditingController lastNameController;

  final TextEditingController emailController;

  final TextEditingController passwordController;

  final TextEditingController confirmPasswordController;

  final TextEditingController phoneNumberController;
  @override
  State<SignUpDonorMobile> createState() => _SignUpDonorMobileState();
}

class _SignUpDonorMobileState extends BaseState<SignUpDonorMobile> {
  String phoneNumberUnmask = '';
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  Timer? _debounce;
  String? selectedRegion;
  String? selectedCity;
  String? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          string.sign_up,
          style: fonts.textLarge,
        ),
        Text(
          string.its_quick_and_easy,
          style: fonts.textRegular.copyWith(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(top: 16),
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
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: widget.nameController,
                      hint: string.name,
                      labelStyle: TextStyle(color: colors.errorColor),
                      labelText: widget.state is SignUpDonorStateValidation &&
                              widget.state.name == ValidationEnum.invalid
                          ? string.name_is_required
                          : widget.state is SignUpDonorStateValidation &&
                                  widget.state.name == ValidationEnum.empty
                              ? 'Name cannot be empty'
                              : null,
                      borderColor: widget.state is SignUpDonorStateValidation &&
                              (widget.state.name == ValidationEnum.invalid ||
                                  widget.state.name == ValidationEnum.empty)
                          ? colors.errorColor
                          : null,
                      onChanged: (value) {
                        if (_debounce?.isActive == true) _debounce?.cancel();
                        _debounce = Timer(
                          const Duration(milliseconds: 600),
                          () {
                            context.read<SignUpDonorBloc>().add(
                                  ValidateDonorName(value),
                                );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: widget.lastNameController,
                      hint: string.last_name,
                      labelStyle: TextStyle(color: colors.errorColor),
                      labelText: widget.state is SignUpDonorStateValidation &&
                              widget.state.lastName == ValidationEnum.invalid
                          ? string.last_name_is_required
                          : widget.state is SignUpDonorStateValidation &&
                                  widget.state.lastName == ValidationEnum.empty
                              ? 'lastName cannot be empty'
                              : null,
                      borderColor: widget.state is SignUpDonorStateValidation &&
                              (widget.state.lastName ==
                                      ValidationEnum.invalid ||
                                  widget.state.lastName == ValidationEnum.empty)
                          ? colors.errorColor
                          : null,
                      onChanged: (value) {
                        if (_debounce?.isActive == true) _debounce?.cancel();
                        _debounce = Timer(
                          const Duration(milliseconds: 600),
                          () {
                            context.read<SignUpDonorBloc>().add(
                                  ValidateDonorLastName(value),
                                );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: widget.emailController,
                hint: string.email,
                labelStyle: TextStyle(color: colors.errorColor),
                labelText: widget.state is SignUpDonorStateValidation &&
                        widget.state.email == ValidationEnum.invalid
                    ? string.email_is_not_correct
                    : widget.state is SignUpDonorStateValidation &&
                            widget.state.email == ValidationEnum.empty
                        ? 'Email cannot be empty'
                        : null,
                borderColor: widget.state is SignUpDonorStateValidation &&
                        (widget.state.email == ValidationEnum.invalid ||
                            widget.state.email == ValidationEnum.empty)
                    ? colors.errorColor
                    : null,
                onChanged: (value) {
                  if (_debounce?.isActive == true) _debounce?.cancel();
                  _debounce = Timer(
                    const Duration(milliseconds: 600),
                    () {
                      context.read<SignUpDonorBloc>().add(
                            ValidateDonorEmail(value),
                          );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: widget.phoneNumberController,
                hint: '99999999',
                labelStyle: TextStyle(color: colors.errorColor),
                labelText: widget.state is SignUpDonorStateValidation &&
                        widget.state.phoneNumber == ValidationEnum.invalid
                    ? string.phone_number_is_not_correct
                    : widget.state is SignUpDonorStateValidation &&
                            widget.state.phoneNumber == ValidationEnum.empty
                        ? 'phone number cannot be empty'
                        : null,
                borderColor: widget.state is SignUpStateValidation &&
                        (widget.state.phoneNumber == ValidationEnum.invalid ||
                            widget.state.phoneNumber == ValidationEnum.empty)
                    ? colors.errorColor
                    : null,
                inputFormatters: [ValidationUtils.maskPhoneNumber],
                keyboardType: TextInputType.phone,
                prefixIcon: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                          color: colors.duskyBlueColor.withOpacity(0.8)),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.all(5),
                  child: const Text("+374"),
                ),
                onChanged: (value) {
                  if (_debounce?.isActive == true) _debounce?.cancel();
                  _debounce = Timer(
                    const Duration(milliseconds: 600),
                    () {
                      phoneNumberUnmask =
                          ValidationUtils.maskPhoneNumber.getUnmaskedText();
                      context.read<SignUpDonorBloc>().add(
                            ValidateDonorPhoneNumber(phoneNumberUnmask),
                          );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown(
                hasError: widget.state is SignUpDonorStateValidation &&
                        (widget.state.region == ValidationEnum.invalid ||
                            widget.state.region == ValidationEnum.empty)
                    ? true
                    : false,
                items: const [
                  'Item1',
                  'Item2',
                  'Item3',
                  'Item4',
                  'Item5',
                  'Item6'
                ],
                hint: string.country,
                onChanged: (value) {
                  selectedCountry = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown(
                hasError: widget.state is SignUpDonorStateValidation &&
                        (widget.state.region == ValidationEnum.invalid ||
                            widget.state.region == ValidationEnum.empty)
                    ? true
                    : false,
                items: const [
                  'Item1',
                  'Item2',
                  'Item3',
                  'Item4',
                  'Item5',
                  'Item6'
                ],
                hint: string.region_state,
                onChanged: (value) {
                  selectedRegion = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown(
                hasError: widget.state is SignUpDonorStateValidation &&
                        (widget.state.region == ValidationEnum.invalid ||
                            widget.state.region == ValidationEnum.empty)
                    ? true
                    : false,
                items: const [
                  'Item1',
                  'Item2',
                  'Item3',
                  'Item4',
                  'Item5',
                  'Item6'
                ],
                hint: string.city,
                onChanged: (value) {
                  selectedCity = value;
                },
              ),
              const SizedBox(
                height: 10,
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
                hint: string.password,
                labelStyle: TextStyle(color: colors.errorColor),
                labelText: widget.state is SignUpDonorStateValidation &&
                        widget.state.password == ValidationEnum.invalid
                    ? string.password_is_too_short
                    : widget.state is SignUpDonorStateValidation &&
                            widget.state.password == ValidationEnum.empty
                        ? 'Password cannot be empty'
                        : null,
                borderColor: widget.state is SignUpDonorStateValidation &&
                        (widget.state.password == ValidationEnum.invalid ||
                            widget.state.password == ValidationEnum.empty)
                    ? colors.errorColor
                    : null,
                onChanged: (value) {
                  if (_debounce?.isActive == true) _debounce?.cancel();
                  _debounce = Timer(
                    const Duration(milliseconds: 600),
                    () {
                      context.read<SignUpDonorBloc>().add(
                            ValidateDonorPassword(value),
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
                controller: widget.confirmPasswordController,
                hint: string.confirm_password,
                labelStyle: TextStyle(color: colors.errorColor),
                labelText: widget.state is SignUpDonorStateValidation &&
                        widget.state.confirmPassword == ValidationEnum.invalid
                    ? string.passwords_doesnt_match
                    : widget.state is SignUpDonorStateValidation &&
                            widget.state.confirmPassword == ValidationEnum.empty
                        ? 'Confirm password cannot be empty'
                        : null,
                borderColor: widget.state is SignUpDonorStateValidation &&
                        (widget.state.confirmPassword ==
                                ValidationEnum.invalid ||
                            widget.state.confirmPassword ==
                                ValidationEnum.empty)
                    ? colors.errorColor
                    : null,
                onChanged: (value) {
                  if (_debounce?.isActive == true) _debounce?.cancel();
                  _debounce = Timer(
                    const Duration(milliseconds: 600),
                    () {
                      context.read<SignUpDonorBloc>().add(
                            ValidateDonorConfirmPassword(
                                value, widget.passwordController.text.trim()),
                          );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      final name = widget.nameController.text.trim();
                      final lastName = widget.lastNameController.text.trim();
                      final email = widget.emailController.text.trim();
                      final password = widget.passwordController.text.trim();
                      final confirmPassword =
                          widget.confirmPasswordController.text.trim();

                      phoneNumberUnmask =
                          ValidationUtils.maskPhoneNumber.getUnmaskedText();
                      context.read<SignUpDonorBloc>().add(SignUpDonor(
                            name: name,
                            lastName: lastName,
                            email: email,
                            phoneNumber: phoneNumberUnmask,
                            password: password,
                            confirmPassword: confirmPassword,
                            region: selectedRegion ?? '',
                            city: selectedCity ?? '',
                            country: selectedCountry ?? '',
                          ));
                    },
                    child: Text(
                      string.ok,
                      style: fonts.textRegular
                          .copyWith(color: colors.mainBackgroundColor),
                    ),
                  ),
                  TextButton(
                      onPressed: () =>
                          context.go('/${AppRouting.signUpTeacher}'),
                      child: Text(
                        string.register_as_a_teacher,
                        style: fonts.textRegular.copyWith(
                          color: colors.greenColor,
                          decoration: TextDecoration.underline,
                          decorationColor: colors.greenColor,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
