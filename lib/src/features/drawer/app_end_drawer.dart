import 'package:flutter/material.dart';

import '../../../routes/route_names.dart';
import 'drawer_list_item.dart';

/// 右侧抽屉组件
class AppEndDrawer extends StatelessWidget {
  const AppEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      shape: _drawerShape,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 40),
            children: const [
              DrawerListItem(
                iconPath: 'assets/setting/books01-7.png',
                title: '食物图鉴',
                routeName: RouteNames.foodbook
              ),
              DrawerListItem(
                iconPath: 'assets/setting/tab_science.png',
                title: '合成工具',
                routeName: RouteNames.maketool
              ),
              DrawerListItem(
                iconPath: 'assets/setting/researchable.png',
                title: '设置',
                routeName: RouteNames.settings
              ),
              DrawerListItem(
                iconPath: 'assets/setting/survivor_filter_on.png',
                title: '关于',
                routeName: RouteNames.about
              ),
            ],
          ),
        ),
      ),
    );
  }

  RoundedRectangleBorder get _drawerShape => const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      bottomLeft: Radius.circular(16),
    ),
  );
}