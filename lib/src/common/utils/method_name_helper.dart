import '../enums/cooking_method.dart';

/// 烹饪方式名称转换工具类
class MethodNameHelper {
  /// 获取枚举对应的显示名称
  static String getDisplayName(CookingMethod method) {
    switch (method) {
      case CookingMethod.campfire:
        return '火堆';
      case CookingMethod.crockPot:
        return '烹饪锅';
      case CookingMethod.portableCooker:
        return '便携锅';
    }
  }
}