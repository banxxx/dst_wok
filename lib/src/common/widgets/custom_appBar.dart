import 'dart:io';

import 'package:dst_wok/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// 自定义返回按钮
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    // 仅 Windows 平台固定样式
    final bool isWindows = Platform.isWindows;

    return AppBar(
      // Windows 平台固定样式
      backgroundColor: isWindows
          ? AppColors.homeBg
          : null, // 其他平台使用主题默认
      surfaceTintColor: isWindows ? Colors.transparent : null,
      elevation: isWindows ? 0 : null,
      scrolledUnderElevation: isWindows ? 0 : null,
      shadowColor: isWindows ? Colors.transparent : null,

      // 通用配置（所有平台）
      leading: IconButton(
        splashColor: Colors.transparent, // 禁用点击水波纹
        highlightColor: Colors.transparent, // 禁用点击高亮
        hoverColor: Colors.transparent, // 禁用悬停效果
        focusColor: Colors.transparent, // 禁用聚焦效果
        constraints: const BoxConstraints(), // 移除默认按钮约束
        padding: EdgeInsets.zero, // 移除默认内边距
        icon: Image.asset('assets/setting/back.png', width: 36, height: 36),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: title,
      centerTitle: true,
      titleSpacing: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
