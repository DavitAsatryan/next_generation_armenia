import 'package:next_generation_armenia/core/data/models/user_model.dart';

abstract class DashboardState {}

class DashboardInitalState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardSuccessState extends DashboardState {
  UserModel userModel;
  DashboardSuccessState({required this.userModel});
}

class DashboardErrorState extends DashboardState {}
