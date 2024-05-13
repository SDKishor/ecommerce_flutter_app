import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key,
    required this.darkmode,
    required this.tabs,
  });

  final bool darkmode;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkmode ? TColors.black : TColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.grey,
        labelColor: darkmode ? TColors.white : TColors.primary,
        tabAlignment: TabAlignment.start,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
