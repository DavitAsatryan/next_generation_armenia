import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_donor/bloc/sign_up_donor_bloc.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_donor/bloc/sign_up_donor_state.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_donor/layouts/sign_up_donor_mobile.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_donor/layouts/sign_up_donor_web.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';

class SignUpDonorScreen extends StatefulWidget {
  const SignUpDonorScreen({super.key});

  @override
  State<SignUpDonorScreen> createState() => _SignUpDonorScreenState();
}

class _SignUpDonorScreenState extends BaseState<SignUpDonorScreen> {
  List<String> items = [
    'item one',
    'item two',
    'item three',
    'item four',
  ];

  String? selectedValue;

  final _nameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  String phoneNumberUnmask = '';
  String? selectedRegion;
  String? selectedCityVilage;
  String? selectedSchool;
  String? selectedSubject;
  String? selectedGrade;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  Timer? _debounce;
  @override
  void dispose() {
    _debounce?.cancel();
    _debounce = null;
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: colors.mainBackgroundColor,
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(
              minWidth: 422,
              maxWidth: 423,
            ),
            decoration: BoxDecoration(
              color: colors.mainBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: colors.shadowsColor,
                  offset: const Offset(0, 0),
                  blurRadius: 24,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: BlocProvider(
              create: (context) => SignUpDonorBloc(),
              child: BlocConsumer<SignUpDonorBloc, SignUpDonorState>(
                  listener: (context, state) {
                if (state is SignUpDonorStateSuccess) {
                  context.go('/${AppRouting.teacher}');
                }
              }, builder: (context, state) {
                return isMobile
                    ? SignUpDonorMobile(
                        state: state,
                        nameController: _nameController,
                        lastNameController: _lastNameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        phoneNumberController: _phoneNumberController,
                      )
                    : SignUpDonorWeb(
                        state: state,
                        nameController: _nameController,
                        lastNameController: _lastNameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        phoneNumberController: _phoneNumberController,
                      );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
