import 'package:flutter/cupertino.dart';

import '../common/enums/cooking_method.dart';
import '../common/enums/ingredient_tag.dart';
import '../common/widgets/cookpot_ingredients.dart';
import '../repositories/constants/game_assets.dart';
import 'base_recipe.dart';

/// 烹饪锅配方实现
class CrockpotRecipe extends BaseRecipe {

  /// 填充位数量
  final int fillerSlots;

  /// 允许的填充物标签
  final Set<IngredientTag> allowedFillers;

  /// 构造函数
  const CrockpotRecipe({
    required super.id,
    required super.name,
    super.requiredTags = const {},
    super.maxTags = const {},
    super.mustContain = const [],
    super.cannotContain = const [],
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

  /// 检查食材组合是否满足此配方
  @override
  bool matches(List<Ingredient> ingredients) {
    if (ingredients.length != 4) return false;

    // 计算总标签值
    Map<IngredientTag, double> totalTags = {};
    for (var ingredient in ingredients) {
      ingredient.tags.forEach((tag, value) {
        totalTags[tag] = (totalTags[tag] ?? 0) + value;
      });
    }

    // 检查必须包含的食材
    for (var requiredId in mustContain) {
      if (!ingredients.any((ingredient) => ingredient.id == requiredId)) {
        return false;
      }
    }

    // 检查不能包含的食材
    for (var forbiddenId in cannotContain) {
      if (ingredients.any((ingredient) => ingredient.id == forbiddenId)) {
        return false;
      }
    }

    // 检查必须满足的标签条件
    for (var entry in requiredTags.entries) {
      if ((totalTags[entry.key] ?? 0) < entry.value) {
        return false;
      }
    }

    // 检查最大标签限制
    for (var entry in maxTags.entries) {
      if ((totalTags[entry.key] ?? 0) > entry.value) {
        return false;
      }
    }

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