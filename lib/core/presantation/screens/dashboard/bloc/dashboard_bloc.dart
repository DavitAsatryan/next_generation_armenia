import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/data/utilities/storage/preferences_manager.dart';
import 'package:next_generation_armenia/core/presantation/screens/dashboard/bloc/dashboard_event.dart';
import 'package:next_generation_armenia/core/presantation/screens/dashboard/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitalState()) {
    on<DashboardInitialEvent>(_onGetUser);
  }

  void _onGetUser(DashboardEvent event, Emitter<DashboardState> emit) async {
    try {
      final userData = await UserPreferences.getUserData();
      emit(DashboardLoadingState());
      if (userData != null) {
        emit(DashboardSuccessState(userModel: userData));
      } else {
        emit(DashboardErrorState());
      }
    } catch (e) {
      emit(DashboardErrorState());
    }
  }
}
