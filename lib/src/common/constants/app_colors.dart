import 'dart:ui';

/// 应用颜色配置
class AppColors {
  // 主色系
  static const Color primary = Color(0xFF209888);
  static const Color secondary = Color(0xFF1B3F66);
  static const Color accent = Color(0xFFA94049);

  // 食谱文本颜色
  static const Color recipeTitle = Color(0xFF603C27);  // 文本标题
  static const Color recipePrimary = Color(0xFFB2744E);   // 文本详情
  static const Color recipeState = Color(0xFF757575);   // 状态类文本
  static const Color recipeBuff = Color(0xFF209888); // '特殊效果'文字
  static const Color recipeCondition = Color(0xFF1B3F66); // '必要条件'文字
  static const Color recipeNotInclude = Color(0xFFA94049); // '不能包含'文字

  // 食谱背景颜色
  static const Color recipeSelectorBg = Color(0xFFFEFCF8);      // 主页面卡片背景
  static const Color recipeSelectorBorderOut = Color(0xFFB2744E);  // 主页面外边框
  static const Color recipeSelectorBorderIn = Color(0xFFF1D7C3);  // 主页面内边框
  static const Color recipeSelectorCutLine = Color(0xFFF1D7C3); // 主页面分割线
  static const Color recipeDetailBg = Color(0xE6FFFFFF);        // 详情页背景
  static const Color recipeDetailBorder = Color(0xFFF1D7C3);    // 详情页边框

  // 食谱专用
  static const Color recipeSpecial = Color(0xFF209888);
  static const Color recipeText = Color(0xFFB2744E);
  static const Color recipeForbidden = Color(0xFFA94049);

  // 通用状态色
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color danger = Color(0xFFDC3545);

  // 中性色
  static const Color gray100 = Color(0xFFF8F9FA);
  static const Color gray600 = Color(0xFF6C757D);
  static const Color gray900 = Color(0xFF212529);
}