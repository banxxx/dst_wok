import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

/// 竖排标签组件
class VerticalLabel extends StatelessWidget {
  // 添加颜色配置选项
  final Color? color;

  // 构造函数允许传入颜色
  const VerticalLabel({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    // 获取当前主题颜色
    final effectiveColor =Theme.of(context).extension<CustomColors>()!.recipeTitle;

    // 动态构建标签列表
    final verticalLabels =
        '掉落自'.split('').map((char) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Text(
              char,
              style: TextStyle(
                fontSize: 13,
                color: effectiveColor, // 使用动态颜色
                height: 0.75,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList();

    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: verticalLabels, // 使用动态构建的列表
      ),
    );
  }
}
