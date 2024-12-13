import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/bloc/sign_up_teacher_bloc.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/bloc/sign_up_teacher_state.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/layouts/sign_up_teacher_mobile.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_up/sign_up_teacher/layouts/sign_up_teacher_web.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';

class SignUpTeacherScreen extends StatefulWidget {
  const SignUpTeacherScreen({super.key});

  @override
  State<SignUpTeacherScreen> createState() => _SignUpTeacherScreenState();
}

class _SignUpTeacherScreenState extends BaseState<SignUpTeacherScreen> {
  List<String> items = [
    'item one',
    'item two',
    'item three',
    'item four',
  ];

  final _nameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
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
              create: (context) => SignUpTeacherBloc(),
              child: BlocConsumer<SignUpTeacherBloc, SignUpTeacherState>(
                  listener: (context, state) {
                if (state is SignUpStateSuccess) {
                  context.go('/${AppRouting.teacher}');
                }
              }, builder: (context, state) {
                return isMobile
                    ? SignUpTeacherMobile(
                        state: state,
                        nameController: _nameController,
                        lastNameController: _lastNameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        phoneNumberController: _phoneNumberController,
                      )
                    : SignUpTeacherWeb(
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
