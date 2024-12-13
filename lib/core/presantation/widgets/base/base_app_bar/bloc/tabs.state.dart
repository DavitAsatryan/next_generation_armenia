import 'package:next_generation_armenia/core/data/enums/tabs_enum.dart';

class TabsState {
  final TabsEnum page;

  const TabsState(this.page);

  factory TabsState.initial(TabsEnum page) {
    return TabsState(page);
  }
}
