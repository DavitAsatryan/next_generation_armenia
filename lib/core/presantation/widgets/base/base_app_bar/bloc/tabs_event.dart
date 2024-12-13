import 'package:next_generation_armenia/core/data/enums/tabs_enum.dart';

abstract class TabsEvent {}

class ChangePage extends TabsEvent {
  final TabsEnum page;

  ChangePage(this.page);
}
