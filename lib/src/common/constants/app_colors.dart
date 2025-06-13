import 'dart:ui';

/// 应用颜色配置
class AppColors {
  // 主色系
  static const Color primary = Color(0xFF209888);
  static const Color secondary = Color(0xFF1B3F66);
  static const Color accent = Color(0xFFA94049);

  // 通用状态色
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color danger = Color(0xFFDC3545);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // 中性色
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray600 = Color(0xFF6C757D);
  static const Color gray800 = Color(0xFF2F3336);
  static const Color gray900 = Color(0xFF212529);

  /// ====== 亮色主题 ======
  static const Color homeBg = Color(0xFFFDF2EE);

  // 食谱文本颜色
  static const Color recipeTitle = Color(0xFF603C27);  // 文本标题
  static const Color recipePrimary = Color(0xFFB2744E);   // 文本详情
  static const Color recipeState = Color(0xFF757575);   // 状态类文本
  static const Color recipeBuff = Color(0xFF209888); // '特殊效果'文字
  static const Color recipeCondition = Color(0xFF1B3F66); // '必要条件'文字
  static const Color recipeNotInclude = Color(0xFFA94049); // '不能包含'文字

  // 食谱背景颜色(亮色主题)
  static const Color recipeSelectorBg = Color(0xFFFFFBF6);      // 主页面卡片背景
  static const Color recipeSelectorBorderOut = Color(0xFFB2744E);  // 主页面外边框
  static const Color recipeSelectorBorderIn = Color(0xFFF1D7C3);  // 主页面内边框
  static const Color recipeSelectorCutLine = Color(0xFFF1D7C3); // 主页面分割线
  static const Color recipeDetailBg = Color(0xFFFFFCFC);        // 详情页背景
  static const Color recipeDetailBorder = Color(0xFFF1D7C3);    // 详情页边框

  // 食谱专用
  static const Color recipeSpecial = Color(0xFF209888);
  static const Color recipeText = Color(0xFFB2744E);
  static const Color recipeForbidden = Color(0xFFA94049);

  // 其他颜色
  static const Color searchBg = Color(0xffffede5);
  static const Color cardBg = Color(0xfffceae4);
  static const Color bannerBg = Color(0xfff6e5cd);
  static const Color sortText = Color(0xff000000);
  static const Color cacheBg = Color(0xff000000);

  /// ======  暗色主题 ======
  static const Color homeBgDark = Color(0xFF1d1d1d);

  // 食谱文本颜色(暗色主题)
  static const Color recipeTitleDark = Color(0xFF603C27);  // 文本标题
  static const Color recipePrimaryDark = Color(0xFFB2744E);   // 文本详情
  static const Color recipeStateDark = Color(0xFF757575);   // 状态类文本
  static const Color recipeBuffDark = Color(0xFF209888); // '特殊效果'文字
  static const Color recipeConditionDark = Color(0xFF1B3F66); // '必要条件'文字
  static const Color recipeNotIncludeDark = Color(0xFFA94049); // '不能包含'文字

  // 食谱背景颜色(暗色主题)
  static const Color recipeSelectorBgDark = Color(0xff282625);      // 主页面卡片背景
  static const Color recipeSelectorBorderOutDark = Color(0xFF694B39);  // 主页面外边框
  static const Color recipeSelectorBorderInDark = Color(0xFF5D371A);  // 主页面内边框
  static const Color recipeSelectorCutLineDark = Color(0xFFF1D7C3); // 主页面分割线
  static const Color recipeDetailBgDark = Color(0xff2a2a2a);        // 详情页背景
  static const Color recipeDetailBorderDark = Color(0xFF49362A);    // 详情页边框

  static const Color searchBgDark = Color(0xffffede5);
  static const Color searchIconDark = Color(0xFF603C27);
  static const Color cardBgDark = Color(0xff343333);
  static const Color bannerBgDark = Color(0x7b423f3f);
  static const Color sortTextDark = Color(0xFF603C27);
  static const Color cacheBgDark = Color(0xffd0d0d0);

}