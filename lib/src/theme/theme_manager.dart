import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';

/// 主题管理器
class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  static const String _themeKey = 'app_theme';

  ThemeMode get themeMode => _themeMode;

  ThemeManager() {
    _initializeTheme();
  }

  /// 初始化主题状态
  Future<void> _initializeTheme() async {
    try {
      // 从持久化存储加载主题
      final prefs = await SharedPreferences.getInstance();
      final savedValue = prefs.getInt(_themeKey);

      // 有效状态: 0=light, 1=dark, 2=system
      if (savedValue != null && savedValue >= 0 && savedValue <= 2) {
        _themeMode = ThemeMode.values[savedValue];
        notifyListeners(); // 通知监听器状态已更新
      }
    } catch (e) {
      debugPrint('主题初始化失败: $e');
    }
  }

  /// 切换主题并保存
  void toggleTheme(bool isDark) {
    _setThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  /// 设置系统主题 (新增)
  void setSystemTheme() {
    _setThemeMode(ThemeMode.system);
  }

  /// 内部统一设置主题方法
  void _setThemeMode(ThemeMode newMode) {
    if (_themeMode == newMode) return;

    _themeMode = newMode;
    notifyListeners();
    _saveTheme();
  }

  /// 保存主题到持久化存储
  Future<void> _saveTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_themeKey, _themeMode.index);
    } catch (e) {
      debugPrint('保存主题失败: $e');
    }
  }

  /// 获取当前主题数据
  ThemeData get currentTheme {
    switch (_themeMode) {
      case ThemeMode.dark:
        return AppTheme.darkTheme();
      case ThemeMode.light:
        return AppTheme.lightTheme();
      case ThemeMode.system:
        // 根据系统设置自动选择
        final isSystemDark =
            WidgetsBinding.instance.window.platformBrightness ==
            Brightness.dark;
        return isSystemDark ? AppTheme.darkTheme() : AppTheme.lightTheme();
    }
  }

  /// 获取当前主题模式名称 (方便UI使用)
  String get themeModeName {
    switch (_themeMode) {
      case ThemeMode.light:
        return '亮色模式';
      case ThemeMode.dark:
        return '暗色模式';
      case ThemeMode.system:
        return '跟随系统';
    }
  }
}
