import 'package:flutter/cupertino.dart';

import '../common/enums/cooking_method.dart';
import '../common/widgets/biology_ingredients.dart';
import '../repositories/constants/game_assets.dart';
import 'base_recipe.dart';

/// 火堆烧烤配方实现
class CampfireRecipe extends BaseRecipe {

  /// 允许烧烤的食材ID列表
  final Set<String> cookableItemIds;

  /// 说明
  final List<Ingredient> tips;

  /// 构造函数
  const CampfireRecipe({
    required super.id,
    required super.name,
    super.requiredTags = const {},
    super.maxTags = const {},
    super.mustContain = const [],
    super.cannotContain = const [],
    this.cookableItemIds = const {},
    required super.cookbook,
    required super.priority,
    required super.imageUrl,
    required super.health,
    required super.hunger,
    required super.sanity,
    super.cookTime = '',
    required super.desc,
    required super.freshness,
    super.favorites = const {},
    required super.sideEffect,
    required super.condition,
    required super.notContain,
    required this.tips,
  }) : super(method: CookingMethod.campfire);

  /// 实现匹配逻辑：
  /// 1. 只能选择1个食材
  /// 2. 食材必须在允许列表中
  @override
  bool matches(List<Ingredient> ingredientIds) {
    return ingredientIds.length == 1 &&
        cookableItemIds.contains(ingredientIds.first.id);
  }

  @override
  Widget buildIngredientsWidget() {
    return BiologyIngredients(tips: tips);
  }
}