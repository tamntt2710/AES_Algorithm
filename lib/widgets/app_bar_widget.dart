import 'package:aes_algorithm/config/colors.dart';
import 'package:aes_algorithm/config/space.dart';
import 'package:aes_algorithm/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {Key? key,
      this.title = "",
      this.onClickMenu,
      this.leading,
      this.icon,
      this.actions,
      this.hasLeading = true,
      this.backgroundColor,
      this.leadingText})
      : super(key: key);
  final String title;
  final Function? onClickMenu;
  final Widget? leading;
  final String? leadingText;
  final bool hasLeading;
  final IconData? icon;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: StyleUtils.style18Bold.copyWith(color: Colors.white),
      ),
      backgroundColor: backgroundColor ?? ColorUtils.primaryColor,
      centerTitle: true,
      leadingWidth: SpaceUtils.spaceExtraLarge,
      leading: !hasLeading
          ? const SizedBox()
          : GestureDetector(
              onTap: () {
                _onTapLeading(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: SpaceUtils.spaceMedium),
                child: Row(
                  children: [
                    leading ??
                        Icon(
                          icon ?? Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                    if (leadingText != null)
                      Text(
                        leadingText ?? '',
                        style: StyleUtils.style16Normal
                            .copyWith(color: ColorUtils.whiteColor),
                      )
                  ],
                ),
              ),
            ),
      actions: actions,
    );
  }

  void _onTapLeading(BuildContext context) {
    if (onClickMenu != null) {
      onClickMenu!();
    } else {
      //default
      // Get.toNamed(Routes.SETTING_NOTIFICATION);
    }
  }

  @override
  Size get preferredSize => Size(Get.width, AppBar().preferredSize.height);
}
