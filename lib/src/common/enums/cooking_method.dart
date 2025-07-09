/// 烹饪方式枚举类
///
/// - campfire: 火堆烧烤（烤制单个食材）
/// - crockPot: 烹饪锅（需要4个食材）
/// - portableCooker: 便携料理锅（特殊设备）
enum CookingMethod {
  campfire,
  crockPot,
  portableCooker
}

/// 烹饪方式扩展 - 添加中文说明
extension CookingMethodExtension on CookingMethod {
  /// 获取中文说明
  String get description {
    switch (this) {
      case CookingMethod.campfire:
        return '火堆烧烤';
      case CookingMethod.crockPot:
        return '烹饪锅';
      case CookingMethod.portableCooker:
        return '便携料理锅';
    }
  }
}