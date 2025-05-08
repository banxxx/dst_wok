import '../repositories/constants/GameAssets.dart';

/// 菜谱示例模型

/// 定位食材模型（带位置说明）
class PositionalIngredient {
  final Ingredient? ingredient;

  const PositionalIngredient({
    this.ingredient,
  });
}

/// 菜谱示例模型
class RecipeExample {
  final PositionalIngredient slot1; // 第1个食材位
  final PositionalIngredient slot2; // 第2个食材位
  final PositionalIngredient slot3; // 第3个食材位
  final PositionalIngredient slot4; // 第4个食材位

  const RecipeExample({
    required this.slot1,
    required this.slot2,
    required this.slot3,
    required this.slot4,
  });

  /// 生成可读性描述（如：肉 + 浆果 + 浆果 + 树枝）
  String get description {
    return [
      slot1.ingredient?.displayName,
      slot2.ingredient?.displayName,
      slot3.ingredient?.displayName,
      slot4.ingredient?.displayName
    ].where((e) => e != null).join(' + ');
  }

  /// 获取所有有效食材
  List<Ingredient> get ingredients {
    return [slot1, slot2, slot3, slot4]
        .map((e) => e.ingredient)
        .whereType<Ingredient>()
        .toList();
  }

  List<PositionalIngredient> get slots => [slot1, slot2, slot3, slot4];
}