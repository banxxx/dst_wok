import 'dart:io';

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
      // backgroundColor: isWindows
      //     ? Colors.amber
      //     : Colors.amber, // 其他平台使用主题默认
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
        icon: _buildThemeAwareBackIcon(context),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: title,
      centerTitle: true,
      titleSpacing: 0,
      actions: actions,
    );
  }

  Widget _buildThemeAwareBackIcon(BuildContext context) {
    // 获取当前主题的图标颜色
    final iconColor = Theme.of(context).iconTheme.color ?? Colors.black;

    return Image.asset(
      'assets/setting/back.png', // 只使用一个图标文件
      width: 36,
      height: 36,
      color: iconColor, // 关键：应用主题颜色
      colorBlendMode: BlendMode.srcIn, // 确保正确应用颜色
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.arrow_back_ios_rounded,
          size: 24,
          color: iconColor,
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
