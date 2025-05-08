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
    return ListTile(
      leading: _buildIcon,
      title: _buildTitle(context),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 16,
      visualDensity: VisualDensity.comfortable,
      onTap: () => _handleTap(context),
    );
  }

  Widget get _buildIcon => Image.asset(
    iconPath,
    width: 48,
    height: 48,
    filterQuality: FilterQuality.high,
  );

  Widget _buildTitle(BuildContext context) => Text(
    title,
    style: TextStyle(
      fontSize: 16,
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white70
          : Colors.black87,
    ),
  );

  void _handleTap(BuildContext context) {
    context.pushNamed(routeName);
  }
}