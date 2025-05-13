import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 抽屉列表项组件
class DrawerListItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String routeName;

  const DrawerListItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, // 减少材质层深度
      child: ListTile(
        leading: _CachedImage(iconPath), // 使用优化后的图片组件
        title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        onTap: () => _navigateToRoute(context, routeName),
      ),
    );
  }

  void _navigateToRoute(BuildContext context, String routeName) {
    // Navigator.pop(context); // 先关闭抽屉
    context.pushNamed(routeName);
  }
}

// 带缓存的图片组件
class _CachedImage extends StatelessWidget {
  final String path;

  const _CachedImage(this.path);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: 42,
      height: 42,
    );
  }
}
