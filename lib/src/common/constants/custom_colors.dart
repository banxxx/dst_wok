import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color success;
  final Color warning;
  final Color cacheBg;
  final Color bannerBg;
  final Color sortText;
  final Color recipeTitle;
  final Color recipePrimary;
  final Color recipeDetailBg;
  final Color recipeSelectorBg;
  final Color recipeDetailBorder;
  final Color recipeSelectorCutLine;
  final Color recipeSelectorBorderOut;
  final Color recipeSelectorBorderIn;

  // 提供空安全的默认值，消除空安全警告
  Color get safeSuccess => success;
  Color get safeWarning => warning;

  // 创建不同主题的工厂构造函数
  const CustomColors._({
    required this.success,
    required this.warning,
    required this.cacheBg,
    required this.bannerBg,
    required this.sortText,
    required this.recipeTitle,
    required this.recipePrimary,
    required this.recipeDetailBg,
    required this.recipeSelectorBg,
    required this.recipeDetailBorder,
    required this.recipeSelectorCutLine,
    required this.recipeSelectorBorderOut,
    required this.recipeSelectorBorderIn,
  });

  // 日间主题配色
  factory CustomColors.light() => const CustomColors._(
    success: Colors.green,
    warning: Colors.amber,
    cacheBg: AppColors.cacheBg,
    bannerBg: AppColors.bannerBg,
    sortText: AppColors.sortText,
    recipeTitle: AppColors.recipeTitle,
    recipePrimary: AppColors.recipePrimary,
    recipeDetailBg: AppColors.recipeDetailBg,
    recipeSelectorBg: AppColors.recipeSelectorBg,
    recipeDetailBorder: AppColors.recipeDetailBorder,
    recipeSelectorCutLine: AppColors.recipeSelectorCutLine,
    recipeSelectorBorderOut: AppColors.recipeSelectorBorderOut,
    recipeSelectorBorderIn: AppColors.recipeSelectorBorderIn,
  );

  // 夜间主题配色
  factory CustomColors.dark() => const CustomColors._(
    success: Colors.lightGreen,
    warning: Colors.yellow,
    cacheBg: AppColors.cacheBgDark,
    bannerBg: AppColors.bannerBgDark,
    sortText: AppColors.sortTextDark,
    recipeTitle: AppColors.recipeTitleDark,
    recipePrimary: AppColors.recipePrimaryDark,
    recipeDetailBg: AppColors.recipeDetailBgDark,
    recipeSelectorBg: AppColors.recipeSelectorBgDark,
    recipeDetailBorder: AppColors.recipeDetailBorderDark,
    recipeSelectorCutLine: AppColors.recipeSelectorCutLineDark,
    recipeSelectorBorderOut: AppColors.recipeSelectorBorderOutDark,
    recipeSelectorBorderIn: AppColors.recipeSelectorBorderInDark,
  );

  // 获取当前主题的自定义颜色的便捷方法
  static CustomColors of(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>();

    assert(colors != null, '未找到CustomColors主题扩展');
    return colors ?? CustomColors.light(); // 安全回退
  }

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? success,
    Color? warning,
    Color? cacheBg,
    Color? bannerBg,
    Color? sortText,
    Color? recipeTitle,
    Color? recipePrimary,
    Color? recipeDetailBg,
    Color? recipeSelectorBg,
    Color? recipeDetailBorder,
    Color? recipeSelectorCutLine,
    Color? recipeSelectorBorderOut,
    Color? recipeSelectorBorderIn,
  }) {
    return CustomColors._(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      cacheBg: cacheBg ?? this.cacheBg,
      bannerBg: bannerBg ?? this.bannerBg,
      sortText: sortText ?? this.sortText,
      recipeTitle: recipeTitle ?? this.recipeTitle,
      recipePrimary: recipePrimary ?? this.recipePrimary,
      recipeDetailBg: recipeDetailBg ?? this.recipeDetailBg,
      recipeSelectorBg: recipeSelectorBg ?? this.recipeSelectorBg,
      recipeDetailBorder: recipeDetailBorder ?? this.recipeDetailBorder,
      recipeSelectorCutLine: recipeSelectorCutLine ?? this.recipeSelectorCutLine,
      recipeSelectorBorderOut: recipeSelectorBorderOut ?? this.recipeSelectorBorderOut,
      recipeSelectorBorderIn: recipeSelectorBorderIn ?? this.recipeSelectorBorderIn,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;

    return CustomColors._(
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      cacheBg: Color.lerp(cacheBg, other.cacheBg, t) ?? cacheBg,
      bannerBg: Color.lerp(bannerBg, other.bannerBg, t) ?? bannerBg,
      sortText: Color.lerp(sortText, other.sortText, t) ?? sortText,
      recipeTitle: Color.lerp(recipeTitle, other.recipeTitle, t) ?? recipeTitle,
      recipePrimary: Color.lerp(recipePrimary, other.recipePrimary, t) ?? recipePrimary,
      recipeDetailBg: Color.lerp(recipeDetailBg, other.recipeDetailBg, t) ?? recipeDetailBg,
      recipeSelectorBg: Color.lerp(recipeSelectorBg, other.recipeSelectorBg, t) ?? recipeSelectorBg,
      recipeDetailBorder: Color.lerp(recipeDetailBorder, other.recipeDetailBorder, t) ?? recipeDetailBorder,
      recipeSelectorCutLine: Color.lerp(recipeSelectorCutLine, other.recipeSelectorCutLine, t) ?? recipeSelectorCutLine,
      recipeSelectorBorderOut: Color.lerp(recipeSelectorBorderOut, other.recipeSelectorBorderOut, t) ?? recipeSelectorBorderOut,
      recipeSelectorBorderIn: Color.lerp(recipeSelectorBorderIn, other.recipeSelectorBorderIn, t) ?? recipeSelectorBorderIn,
    );
  }
}