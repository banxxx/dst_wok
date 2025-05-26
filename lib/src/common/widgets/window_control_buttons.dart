import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowControlButtons extends StatefulWidget {
  const WindowControlButtons({super.key});

  @override
  State<WindowControlButtons> createState() => _WindowControlButtonsState();
}

class _WindowControlButtonsState extends State<WindowControlButtons> {
  // 手动管理状态
  bool _isMaximized = false;
  bool _isAlwaysOnTop = false;

  @override
  void initState() {
    super.initState();
    // 初始状态获取
    _isMaximized = appWindow.isMaximized;
    _initAlwaysOnTopState();
  }

  // 初始化置顶状态
  void _initAlwaysOnTopState() async {
    try {
      final isOnTop = await windowManager.isAlwaysOnTop();
      if (mounted) {
        setState(() {
          _isAlwaysOnTop = isOnTop;
        });
      }
    } catch (e) {
      debugPrint('获取置顶状态失败: $e');
    }
  }

  void _updateMaximizeState() {
    setState(() {
      _isMaximized = !appWindow.isMaximized;
    });
  }

  // 切换置顶状态
  void _toggleAlwaysOnTop() async {
    try {
      final newState = !_isAlwaysOnTop;
      await windowManager.setAlwaysOnTop(newState);
      if (mounted) {
        setState(() {
          _isAlwaysOnTop = newState;
        });
      }
    } catch (e) {
      debugPrint('设置置顶状态失败: $e');
      // 可以在这里添加错误提示
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('设置窗口置顶失败: $e'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  WindowButtonColors _buttonColors(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return WindowButtonColors(
      iconNormal: colorScheme.onSurface.withOpacity(0.7),
      iconMouseOver: colorScheme.onPrimary,
      iconMouseDown: colorScheme.onPrimary,
      mouseOver: colorScheme.primary.withOpacity(0.2),
      mouseDown: colorScheme.primary.withOpacity(0.4),
      normal: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          // 置顶按钮
          child: WindowButton(
            colors: _buttonColors(context),
            onPressed: _toggleAlwaysOnTop,
            iconBuilder:
                (context) => Icon(
                  _isAlwaysOnTop ? Icons.push_pin : Icons.push_pin_outlined,
                  size: 16,
                  color: _isAlwaysOnTop ? Colors.grey : null,
                ),
          ),
        ),
        SizedBox(
          height: 30,
          // 最小化按钮
          child: WindowButton(
            colors: _buttonColors(context),
            onPressed: appWindow.minimize,
            iconBuilder: (context) => const Icon(Icons.remove, size: 16),
          ),
        ),
        SizedBox(
          height: 30,
          // 最大化/还原按钮
          child: WindowButton(
            colors: _buttonColors(context),
            onPressed: () {
              appWindow.maximizeOrRestore();
              // 手动更新状态
              _updateMaximizeState();
            },
            iconBuilder:
                (context) => Icon(
                  _isMaximized
                      ? Icons.close_fullscreen
                      : Icons.check_box_outline_blank_rounded,
                  size: 16,
                ),
          ),
        ),
        SizedBox(
          height: 30,
          // 关闭按钮
          child: WindowButton(
            colors: WindowButtonColors(
              normal: Colors.transparent,
              mouseOver: Colors.red[600],
              mouseDown: Colors.red[600],
              iconNormal: Theme.of(context).colorScheme.onSurface,
              iconMouseOver: Colors.red,
              iconMouseDown: Colors.redAccent,
            ),
            onPressed: appWindow.close,
            iconBuilder: (context) => const Icon(Icons.close, size: 18),
          ),
        ),
      ],
    );
  }
}
