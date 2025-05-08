import 'package:flutter/material.dart';

import '../../common/enums/cooking_method.dart';
import 'method_selector.dart';

/// 侧滑按钮组件
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CookingMethod currentMethod;
  final ValueChanged<CookingMethod> onMethodChanged;
  final VoidCallback openDrawer;

  const CustomAppBar({
    super.key,
    required this.currentMethod,
    required this.onMethodChanged,
    required this.openDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title: MethodSelector(
        currentMethod: currentMethod,
        onMethodChanged: onMethodChanged,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Image.asset('assets/other/pigking.png', width: 48),
          onPressed: openDrawer,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}