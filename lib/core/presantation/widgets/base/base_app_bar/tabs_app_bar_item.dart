import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_generation_armenia/core/data/enums/tabs_enum.dart';
import 'package:next_generation_armenia/core/presantation/utilities/typography/text_theme.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_app_bar/bloc/tabs_bloc.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_app_bar/bloc/tabs_event.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_stateless_state.dart';

class TabsAppBarItem extends BaseStatelessWidget {
  TabsAppBarItem({
    super.key,
    required this.type,
  });

  final TabsEnum type;

  @override
  Widget baseBuild(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<TabsBloc>().add(ChangePage(type));

        context.go('/${type.page}');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: context.read<TabsBloc>().isPageSelected(type)
                  ? colors.mainBackgroundColor
                  : colors.greenColor,
              width: 2,
            ),
          ),
        ),
        child: Text(
          type.title(context).toUpperCase(),
          style: fonts.textRegular.copyWith(
            fontWeight: FontWeight.w700,
            color: context.read<TabsBloc>().isPageSelected(type)
                ? colors.mainBackgroundColor
                : colors.softWhite,
          ),
        ),
      ),
    );
  }
}
