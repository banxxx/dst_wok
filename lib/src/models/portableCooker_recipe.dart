import '../common/enums/cooking_method.dart';
import '../common/enums/ingredient_tag.dart';
import 'base_recipe.dart';

/// 便携烹饪锅配方实现
class PortableCookerRecipe extends BaseRecipe {

  /// 必须满足的标签条件
  final Map<IngredientTag, double> requiredTags;

  /// 填充位数量
  final int fillerSlots;

  /// 允许的填充物标签
  final Set<IngredientTag> allowedFillers;

  /// 构造函数
  const PortableCookerRecipe({
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
  }) : super(method: CookingMethod.portableCooker);

  @override
  bool matches(List<String> ingredientIds) {
    // 实现需要更复杂的食材标签计算
    // 这里暂时返回true保持示例简单
    return true;
  }
}