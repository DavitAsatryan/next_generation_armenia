import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_generation_armenia/core/data/enums/tabs_enum.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_app_bar/bloc/tabs.state.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_app_bar/bloc/tabs_bloc.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_app_bar/tabs_app_bar_item.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_stateless_state.dart';

class TabsAppBar extends BaseStatelessWidget {
  TabsAppBar({super.key});

  @override
  Widget baseBuild(BuildContext context) {
    return BlocBuilder<TabsBloc, TabsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TabsAppBarItem(type: TabsEnum.teacher),
            const SizedBox(width: 20),
            TabsAppBarItem(type: TabsEnum.donor),
            const SizedBox(width: 20),
            TabsAppBarItem(type: TabsEnum.aboutUs),
            const SizedBox(width: 20),
            TabsAppBarItem(type: TabsEnum.contactUs),
            const SizedBox(width: 20),
            TabsAppBarItem(type: TabsEnum.blog),
          ],
        );
      },
    );
  }
}
