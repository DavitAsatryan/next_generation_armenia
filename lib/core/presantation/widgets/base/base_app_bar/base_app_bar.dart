import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:next_generation_armenia/core/data/enums/tabs_enum.dart';
import 'package:next_generation_armenia/core/presantation/utilities/bloc/locale_bloc/locale_bloc.dart';
import 'package:next_generation_armenia/core/presantation/utilities/bloc/locale_bloc/locale_event.dart';
import 'package:next_generation_armenia/core/presantation/utilities/routes/app_router.dart';
import 'package:next_generation_armenia/core/presantation/utilities/typography/text_theme.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_app_bar/tabs_app_bar.dart';
import 'package:next_generation_armenia/core/presantation/widgets/base/base_stateless_state.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BaseAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  BaseAppBar({
    super.key,
    required this.title,
    required this.appBarHeight,
  });

  final String title;
  final double appBarHeight;

  @override
  Widget baseBuild(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: colors.greenColor,
      primary: false,
      toolbarHeight: 90,
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "lib/core/presantation/utilities/assets/images/logo.png",
              width: 41,
              height: 37,
            ),
            isMobile
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Next Generation \n Armenia",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                        color: colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
          ],
        ),
      ),
      bottom: isMobile
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Row(
                children: [
                  const Spacer(),
                  Center(child: TabsAppBar()),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => context.go('/${AppRouting.signIn}'),
                    child: Row(
                      children: [
                        Image.asset(
                          "lib/core/presantation/utilities/assets/icons/sign_in_icon.png",
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          string.sign_in,
                          style: fonts.textRegular.copyWith(
                            color: colors.mainBackgroundColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 110,
                  ),
                ],
              ),
            ),
      actions: isMobile
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (context) => _buildModalContent(context),
                      );
                    },
                    child: Icon(
                      Icons.menu,
                      color: colors.white,
                    )),
              ),
            ]
          : [
              GestureDetector(
                onTap: () {
                  context.read<LocaleBloc>().add(
                        ChangeLocaleEvent(
                          const Locale('en'),
                        ),
                      );
                },
                child: Text(
                  'Eng',
                  style: fonts.textRegular.copyWith(
                    color: colors.mainBackgroundColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => context
                    .read<LocaleBloc>()
                    .add(ChangeLocaleEvent(const Locale('am'))),
                child: Text(
                  'Հայ',
                  style: fonts.textRegular.copyWith(
                    color: colors.mainBackgroundColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () => context
                    .read<LocaleBloc>()
                    .add(ChangeLocaleEvent(const Locale('ru'))),
                child: Text(
                  'Рус',
                  style: fonts.textRegular.copyWith(
                    color: colors.mainBackgroundColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
    );
  }

  Widget _buildModalContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors.greenColor,
              ),
              height: 4,
              width: 32,
            ),
            _buildListTile(
              title: 'hompage',
              onTap: () {
                context.go('/${TabsEnum.teacher.page}');
                Navigator.pop(context);
              },
            ),
            _buildListTile(
              title: string.teachers,
              onTap: () {
                context.go('/${TabsEnum.teacher.page}');
                Navigator.pop(context);
              },
            ),
            _buildListTile(
              title: string.donors,
              onTap: () {
                context.go('/${TabsEnum.donor.page}');
                Navigator.pop(context);
              },
            ),
            _buildListTile(
              title: string.about_us,
              onTap: () {
                context.go('/${TabsEnum.aboutUs.page}');
                Navigator.pop(context);
              },
            ),
            _buildListTile(
              title: string.contact_us,
              onTap: () {
                context.go('/${TabsEnum.contactUs.page}');
                Navigator.pop(context);
              },
            ),
            _buildListTile(
              title: string.blog,
              onTap: () {
                context.go('/${TabsEnum.blog.page}');
                Navigator.pop(context);
              },
            ),
            _buildListTileLanguages(context, title: 'Eng', onTap: () {
              context
                  .read<LocaleBloc>()
                  .add(ChangeLocaleEvent(const Locale('en')));
              Navigator.pop(context);
            }),
            _buildListTileLanguages(context, title: 'Հայ', onTap: () {
              context
                  .read<LocaleBloc>()
                  .add(ChangeLocaleEvent(const Locale('am')));
              Navigator.pop(context);
            }),
            _buildListTileLanguages(context, title: 'Рус', onTap: () {
              context
                  .read<LocaleBloc>()
                  .add(ChangeLocaleEvent(const Locale('ru')));
              Navigator.pop(context);
            }),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(
                "lib/core/presantation/utilities/assets/icons/sign_in_icon.png",
                color: colors.grayColor,
              ),
              title: Text(
                string.sign_in,
                style: fonts.textRegular.copyWith(
                  color: colors.grayColor,
                ),
              ),
              onTap: () {
                context.go('/${AppRouting.signIn}');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title),
          onTap: onTap,
        ),
        Divider(
          height: 0.5,
          color: colors.greenColor,
        ),
      ],
    );
  }

  Widget _buildListTileLanguages(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: fonts.textRegular.copyWith(
              color: colors.grayColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

// ignore: must_be_immutable
class TabItem extends StatelessWidget {
  TabItem({
    super.key,
    required this.title,
  });
  String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(title),
    );
  }
}
