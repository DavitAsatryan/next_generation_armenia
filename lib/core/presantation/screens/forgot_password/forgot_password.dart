import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgot_password/bloc/forgot_password_state.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgot_password/layouts/forgot_password_mobile.dart';
import 'package:next_generation_armenia/core/presantation/screens/forgot_password/layouts/forgot_password_web.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends BaseState<ForgotPassword> {
  final _emailController = TextEditingController();
  Timer? _debounce;
  @override
  void dispose() {
    _emailController.dispose();
    _debounce?.cancel();
    _debounce = null;
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
              maxHeight: 600,
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
              create: (context) => ForgotPasswordBloc(),
              child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                listener: (context, state) {
                  if (state is ForgotPasswordSuccessState) {
                    context.go('/${AppRouting.forgotPasswordCode}');
                  }
                },
                builder: (context, state) {
                  return isMobile
                      ? ForgotPasswordMobile(
                          emailController: _emailController,
                          state: state,
                        )
                      : ForgotPasswordWeb(
                          emailController: _emailController,
                          state: state,
                        );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
