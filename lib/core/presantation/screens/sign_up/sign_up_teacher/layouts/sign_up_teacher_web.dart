import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:next_generation_armenia/core/data/enums/validation_enum.dart';
import 'package:next_generation_armenia/core/data/utilities/validation_utils.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/bloc/sign_up_teacher_bloc.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/bloc/sign_up_teacher_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/bloc/sign_up_teacher_state.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';
import 'package:next_generation_armenia/core/presantation/utilities/typography/text_theme.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/custom_widgets/custom_drop_down.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/custom_widgets/custom_text_filed.dart';
import 'package:provider/provider.dart';

class SignUpTeacherWeb extends StatefulWidget {
  const SignUpTeacherWeb({
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
  State<SignUpTeacherWeb> createState() => _SignUpTeacherWebState();
}

class _SignUpTeacherWebState extends BaseState<SignUpTeacherWeb> {
  String phoneNumberUnmask = '';
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  Timer? _debounce;
  String? selectedRegion;
  String? selectedCityVilage;
  String? selectedSchool;
  String? selectedSubject;
  String? selectedGrade;
  @override
  void dispose() {
    _debounce?.cancel();
    _debounce = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          string.sign_up,
          style: fonts.textLarge.copyWith(
            fontSize: 28,
          ),
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
                      labelText: widget.state is SignUpStateValidation &&
                              widget.state.name == ValidationEnum.invalid
                          ? 'Invalid name'
                          : widget.state is SignUpStateValidation &&
                                  widget.state.name == ValidationEnum.empty
                              ? string.name_is_required
                              : null,
                      borderColor: widget.state is SignUpStateValidation &&
                              (widget.state.name == ValidationEnum.invalid ||
                                  widget.state.name == ValidationEnum.empty)
                          ? colors.errorColor
                          : null,
                      onChanged: (value) {
                        if (_debounce?.isActive == true) _debounce?.cancel();
                        _debounce = Timer(
                          const Duration(milliseconds: 600),
                          () {
                            context.read<SignUpTeacherBloc>().add(
                                  ValidateName(value),
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
                      labelText: widget.state is SignUpStateValidation &&
                              widget.state.lastName == ValidationEnum.invalid
                          ? 'Invalid lastName'
                          : widget.state is SignUpStateValidation &&
                                  widget.state.lastName == ValidationEnum.empty
                              ? string.last_name_is_required
                              : null,
                      borderColor: widget.state is SignUpStateValidation &&
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
                            context.read<SignUpTeacherBloc>().add(
                                  ValidateLastName(value),
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
                labelText: widget.state is SignUpStateValidation &&
                        widget.state.email == ValidationEnum.invalid
                    ? string.email_is_not_correct
                    : widget.state is SignUpStateValidation &&
                            widget.state.email == ValidationEnum.empty
                        ? 'Email cannot be empty'
                        : null,
                borderColor: widget.state is SignUpStateValidation &&
                        (widget.state.email == ValidationEnum.invalid ||
                            widget.state.email == ValidationEnum.empty)
                    ? colors.errorColor
                    : null,
                onChanged: (value) {
                  if (_debounce?.isActive == true) _debounce?.cancel();
                  _debounce = Timer(
                    const Duration(milliseconds: 600),
                    () {
                      context.read<SignUpTeacherBloc>().add(
                            ValidateEmail(value),
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
                hint: '33112244',
                labelStyle: TextStyle(color: colors.errorColor),
                labelText: widget.state is SignUpStateValidation &&
                        widget.state.phoneNumber == ValidationEnum.invalid
                    ? string.phone_number_is_not_correct
                    : widget.state is SignUpStateValidation &&
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
                          width: 0.5,
                          color: colors.duskyBlueColor.withOpacity(0.8)),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.all(5),
                  child: Text("+374",
                      style: fonts.textRegular.copyWith(fontSize: 16)),
                ),
                onChanged: (value) {
                  if (_debounce?.isActive == true) _debounce?.cancel();
                  _debounce = Timer(
                    const Duration(milliseconds: 600),
                    () {
                      phoneNumberUnmask =
                          ValidationUtils.maskPhoneNumber.getUnmaskedText();
                      context.read<SignUpTeacherBloc>().add(
                            ValidatePhoneNumber(phoneNumberUnmask),
                          );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown(
                hasError: widget.state is SignUpStateValidation &&
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
                hint: string.region,
                onChanged: (value) {
                  selectedRegion = value;
                  context.read<SignUpTeacherBloc>().add(
                        ValidateRegion(
                          selectedRegion ?? '',
                        ),
                      );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown(
                hasError: widget.state is SignUpStateValidation &&
                        (widget.state.cityVilage == ValidationEnum.invalid ||
                            widget.state.cityVilage == ValidationEnum.empty)
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
                hint: string.city_village,
                hasSearchSection: true,
                onChanged: (value) {
                  selectedCityVilage = value;
                  context.read<SignUpTeacherBloc>().add(
                        ValidateCityVilage(
                          selectedCityVilage ?? '',
                        ),
                      );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown(
                hasError: widget.state is SignUpStateValidation &&
                        (widget.state.school == ValidationEnum.invalid ||
                            widget.state.school == ValidationEnum.empty)
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
                hint: string.school,
                hasSearchSection: true,
                onChanged: (value) {
                  selectedSchool = value;
                  context.read<SignUpTeacherBloc>().add(
                        ValidateSchool(
                          selectedSchool ?? '',
                        ),
                      );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown(
                hasError: widget.state is SignUpStateValidation &&
                        (widget.state.subject == ValidationEnum.invalid ||
                            widget.state.subject == ValidationEnum.empty)
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
                hint: string.subject,
                hasCheckedBox: true,
                hasSearchSection: true,
                onChanged: (value) {
                  selectedSubject = value;
                  context.read<SignUpTeacherBloc>().add(
                        ValidateSubject(
                          selectedSubject ?? '',
                        ),
                      );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown(
                hasError: widget.state is SignUpStateValidation &&
                        (widget.state.grage == ValidationEnum.invalid ||
                            widget.state.grage == ValidationEnum.empty)
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
                hint: string.grade,
                hasCheckedBox: true,
                onChanged: (value) {
                  selectedGrade = value;
                  context.read<SignUpTeacherBloc>().add(
                        ValidateGrade(
                          selectedGrade ?? '',
                        ),
                      );
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
                labelText: widget.state is SignUpStateValidation &&
                        widget.state.password == ValidationEnum.invalid
                    ? 'Invalid password'
                    : widget.state is SignUpStateValidation &&
                            widget.state.password == ValidationEnum.empty
                        ? 'Password cannot be empty'
                        : null,
                borderColor: widget.state is SignUpStateValidation &&
                        (widget.state.password == ValidationEnum.invalid ||
                            widget.state.password == ValidationEnum.empty)
                    ? colors.errorColor
                    : null,
                onChanged: (value) {
                  if (_debounce?.isActive == true) _debounce?.cancel();
                  _debounce = Timer(
                    const Duration(milliseconds: 600),
                    () {
                      context.read<SignUpTeacherBloc>().add(
                            ValidatePassword(value),
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
                labelText: widget.state is SignUpStateValidation &&
                        widget.state.confirmPassword == ValidationEnum.invalid
                    ? string.passwords_doesnt_match
                    : widget.state is SignUpStateValidation &&
                            widget.state.confirmPassword == ValidationEnum.empty
                        ? 'Confirm password cannot be empty'
                        : null,
                borderColor: widget.state is SignUpStateValidation &&
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
                      context.read<SignUpTeacherBloc>().add(
                            ValidateConfirmePassword(
                                value, widget.passwordController.text.trim()),
                          );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => context.go('/${AppRouting.signUpDonor}'),
                      child: Text(
                        string.register_as_a_donor,
                        style: fonts.textRegular.copyWith(
                          color: colors.greenColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: colors.greenColor,
                        ),
                      )),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
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
                      context.read<SignUpTeacherBloc>().add(
                            SignUp(
                              name: name,
                              lastName: lastName,
                              email: email,
                              phoneNumber: phoneNumberUnmask,
                              password: password,
                              confirmPassword: confirmPassword,
                              region: selectedRegion ?? '',
                              cityVilage: selectedCityVilage ?? '',
                              school: selectedSchool ?? '',
                              subject: selectedSubject ?? '',
                              grade: selectedGrade ?? '',
                            ),
                          );
                    },
                    child: Text(
                      string.ok,
                      style: fonts.textRegular
                          .copyWith(color: colors.mainBackgroundColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
