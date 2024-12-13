import 'package:flutter/material.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_app_bar/base_app_bar.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_stateless_state.dart';

// ignore: must_be_immutable
class HomeScreen extends BaseStatelessWidget {
  HomeScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: string.teachers,
        appBarHeight: isMobile ? 60 : 120,
      ),
      body: child,
    );
  }
}
