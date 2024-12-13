import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/presantation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:next_generation_armenia/core/presantation/screens/dashboard/bloc/dashboard_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/dashboard/bloc/dashboard_state.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc()..add(DashboardInitialEvent()),
      child:
          BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
        if (state is DashboardSuccessState) {
          return Center(
            child: Text("welcome  ${state.userModel.email}"),
          );
        }
        return const Center(
          child: Text("welcome "),
        );
      }),
    );
  }
}
