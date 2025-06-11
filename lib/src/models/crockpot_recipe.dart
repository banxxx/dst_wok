import 'package:flutter/cupertino.dart';

import '../common/enums/cooking_method.dart';
import '../common/enums/ingredient_tag.dart';
import '../common/widgets/cookpot_ingredients.dart';
import 'base_recipe.dart';

/// 烹饪锅配方实现
class CrockpotRecipe extends BaseRecipe {

  /// 必须满足的标签条件
  final Map<IngredientTag, double> requiredTags;

  /// 填充位数量
  final int fillerSlots;

  /// 允许的填充物标签
  final Set<IngredientTag> allowedFillers;

  /// 构造函数
  const CrockpotRecipe({
    required super.id,
    required super.name,
    required this.requiredTags,
    required this.fillerSlots,
    this.allowedFillers = const {},
    required super.cookbook,
    required super.priority,
    required super.imageUrl,
    required super.health,
    required super.hunger,
    required super.sanity,
    required super.cookTime,
    required super.freshness,
    required super.desc,
    super.favorites = const {},
    required super.sideEffect,
    required super.condition,
    required super.notContain,
  }) : super(method: CookingMethod.crockPot);

  @override
  bool matches(List<String> ingredientIds) {
    // 实现需要更复杂的食材标签计算
    // 这里暂时返回true保持示例简单
    return true;
  }

  @override
  Widget buildIngredientsWidget() {
    // 构建 CrockpotRecipe 对应的 CookpotIngredients 组件
    // 注意：这里假设你总是使用第一个 cookbook 条目
    // 如果 cookbook 可以有多个条目，你可能需要更复杂的逻辑来决定显示哪个
    // 或者根据 selectedMethod 来选择
    if (cookbook.isNotEmpty) {
      return CookpotIngredients(slots: cookbook.first.slots);
    } else {
      // 如果 cookbook 为空，显示一个空组件或错误提示
      return const SizedBox();
    }
  }
}