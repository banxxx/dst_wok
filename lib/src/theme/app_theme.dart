import 'package:flutter/material.dart';

/// 主题配置文件
class AppTheme {
  // 白天主题
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
        primary: Colors.blue,
        secondary: Colors.orange,
      ),
      textTheme: _buildTextTheme(),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 2,
          actionsIconTheme: IconThemeData.fallback(

          )
      ),
      extensions: <ThemeExtension<dynamic>>{
        CustomColors(
          success: Colors.green,
          warning: Colors.amber,
        ),
      },
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
      textTheme: _buildTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      extensions: <ThemeExtension<dynamic>>{
        CustomColors(
          success: Colors.lightGreen,
          warning: Colors.yellow,
        ),
      },
    );
  }

  // 文字样式统一配置
  static TextTheme _buildTextTheme() {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.5,
      ),
    );
  }
}

// 自定义扩展颜色
class CustomColors extends ThemeExtension<CustomColors> {
  final Color success;
  final Color warning;

  const CustomColors({
    required this.success,
    required this.warning,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? success,
    Color? warning,
  }) {
    return CustomColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
    );
  }
}