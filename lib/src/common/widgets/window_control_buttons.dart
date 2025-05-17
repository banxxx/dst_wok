import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowControlButtons extends StatefulWidget {
  const WindowControlButtons({super.key});

  @override
  State<WindowControlButtons> createState() => _WindowControlButtonsState();
}

class _WindowControlButtonsState extends State<WindowControlButtons> {
  // 手动管理状态
  bool _isMaximized = true;

  @override
  void initState() {
    super.initState();
    // 初始状态获取
    _isMaximized = appWindow.isMaximized;
  }

  void _updateMaximizeState() {
    setState(() {
      _isMaximized = appWindow.isMaximized;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 最小化按钮
        WindowButton(
          // colors: iconNormal,
          onPressed: appWindow.minimize,
          iconBuilder: (context) => const Icon(Icons.remove, size: 16),
        ),
        // 最大化/还原按钮
        WindowButton(
          // colors: buttonColors,
          onPressed: () {
            appWindow.maximizeOrRestore();
            // 手动更新状态
            _updateMaximizeState();
          },
          iconBuilder: (context) => Icon(
            _isMaximized
                ? Icons.check_box_outline_blank_rounded
                : Icons.close_fullscreen,
            size: 16,
          ),
        ),
        // 关闭按钮
        WindowButton(
          // colors: closeButtonColors,
          onPressed: appWindow.close,
          iconBuilder: (context) => const Icon(Icons.close_rounded, size: 18),
        ),
      ],
    );
  }
}