import 'package:flutter/material.dart';

import '../common/constants/app_colors.dart';
import '../common/constants/custom_colors.dart';

/// 主题配置文件
class AppTheme {
  // 白天主题
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.brown,
        brightness: Brightness.light,
        primary: Colors.brown,
        secondary: Colors.brown,
      ),
      textTheme: _buildTextTheme(),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.homeBg,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.gray800, // 设置图标颜色
      ),
      cardColor: AppColors.cardBg,
      extensions: <ThemeExtension<dynamic>>{CustomColors.light()},
    );
  }

  // 夜间主题
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blueGrey,
        brightness: Brightness.dark,
        primary: Colors.blueGrey,
        secondary: Colors.amber,
      ),
      textTheme: _buildTextTheme(),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.homeBgDark,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.gray400, // 设置图标颜色
      ),
      cardColor: AppColors.cardBgDark,
      extensions: <ThemeExtension<dynamic>>{CustomColors.dark()},
    );
  }

  // 文字样式统一配置
  static TextTheme _buildTextTheme() {
    return TextTheme(
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 16, height: 1.5),
    );
  }
}
