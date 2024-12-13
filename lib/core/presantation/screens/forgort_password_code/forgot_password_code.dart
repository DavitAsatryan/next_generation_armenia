import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'bloc/forgot_password_code_bloc.dart';
import 'bloc/forgot_password_code_state.dart';
import 'layouts/forgot_password_code_mobile.dart';
import 'layouts/forgot_password_code_web.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_state.dart';

class ForgotPasswordCode extends StatefulWidget {
  const ForgotPasswordCode({super.key});

  @override
  State<ForgotPasswordCode> createState() => _ForgotPasswordCodeState();
}

class _ForgotPasswordCodeState extends BaseState<ForgotPasswordCode> {
  final _recoveryController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmePasswordController = TextEditingController();
  Timer? _debounce;
  @override
  void dispose() {
    _recoveryController.dispose();
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
              create: (context) => ForgotPasswordCodeBloc(),
              child:
                  BlocConsumer<ForgotPasswordCodeBloc, ForgotPasswordCodeState>(
                listener: (context, state) {
                  if (state is ForgotPasswordCodeSuccessState) {
                    context.go('/${AppRouting.teacher}');
                  }
                },
                builder: (context, state) {
                  return isMobile
                      ? ForgotPasswordCodeMobile(
                          recoveryController: _recoveryController,
                          confirmePasswordController:
                              _confirmePasswordController,
                          passwordController: _passwordController,
                          state: state,
                        )
                      : ForgotPasswordCodeWeb(
                          recoveryController: _recoveryController,
                          confirmePasswordController:
                              _confirmePasswordController,
                          passwordController: _passwordController,
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
