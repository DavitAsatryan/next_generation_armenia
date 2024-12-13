import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_generation_armenia/core/data/models/user_model.dart';
import 'package:next_generation_armenia/core/data/utilities/storage/preferences_manager.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_in/bloc/sign_in_state.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_in/layouts/sign_in_mobile.dart';
import 'package:next_generation_armenia/core/presantation/screens/sign_in/layouts/sign_in_web.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends BaseState<SignInScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  Timer? _debounce;
  bool hidePassword = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _debounce?.cancel();
    _debounce = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            create: (context) => SignInBloc(),
            child: BlocConsumer<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state is SignInSuccessState) {
                  UserPreferences.saveUserData(state.user ??
                      UserModel(
                        name: state.user?.name,
                        email: state.user?.email,
                      ));
                  context.go('/${AppRouting.dashboard}');
                }
              },
              builder: (context, state) {
                return isMobile
                    ? SignInMobile(
                        emailController: _emailController,
                        passwordController: _passwordController,
                        state: state,
                      )
                    : SignInWeb(
                        emailController: _emailController,
                        passwordController: _passwordController,
                        state: state,
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
