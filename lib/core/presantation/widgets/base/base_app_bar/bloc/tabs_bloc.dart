import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/data/enums/tabs_enum.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_app_bar/bloc/tabs.state.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_app_bar/bloc/tabs_event.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  TabsBloc() : super(TabsState.initial(TabsEnum.teacher)) {
    on<ChangePage>(
      (event, emit) {
        emit(TabsState(event.page));
      },
    );
  }

  bool isPageSelected(TabsEnum page) {
    return state.page == page;
  }
}
