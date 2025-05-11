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
      child: _buildOptimizedContent(context),
    );
  }

  Widget _buildOptimizedContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        backgroundBlendMode: BlendMode.colorBurn, // 移除不必要的混合模式
      ),
      child: SafeArea(
        child: _buildListView(),
      ),
    );
  }

  Widget _buildListView() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 40),
      addRepaintBoundaries: false, // 对静态列表禁用重绘边界
      children: const [
        DrawerListItem(
            iconPath: 'assets/setting/foodbook_64.png',
            title: '食物图鉴',
            routeName: RouteNames.foodbook
        ),
        DrawerListItem(
            iconPath: 'assets/setting/maketool_64.png',
            title: '合成工具',
            routeName: RouteNames.maketool
        ),
        // DrawerListItem(
        //     iconPath: 'assets/setting/setting_64.png',
        //     title: '设置',
        //     routeName: RouteNames.settings
        // ),
        DrawerListItem(
            iconPath: 'assets/setting/about_64.png',
            title: '关于',
            routeName: RouteNames.about
        ),
        // 其他列表项...
      ],
    );
  }
}