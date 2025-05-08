import 'package:dst_wok/src/models/recipe_example.dart';

import '../common/enums/character.dart';
import '../common/enums/cooking_method.dart';

/// 所有食谱的抽象基类
/// 定义通用属性和匹配方法
abstract class BaseRecipe {
  // 编号ID
  final String id;

  // 显示名称（如"肉丸"）
  final String name;

  // 所属烹饪方式（火堆/烹饪锅/便携锅）
  final CookingMethod method;

  // 优先级（数值越大越优先匹配）
  final int priority;

  // 配方图片资源路径
  final String imageUrl;

  // 生命值
  final double health;

  // 饥饿值
  final double hunger;

  // san值
  final double sanity;

  // 烹饪所需时间
  final String cookTime;

  // 保质期
  final String freshness;

  // 补充说明
  final String desc;

  // 偏好角色
  final Set<Character> favorites;

  // 副作用(文字描述)
  final String sideEffect;

  // 烹饪条件(文字描述)
  final String condition;

  // 不能包含(文字描述)
  final String notContain;

  // 菜谱示例
  final List<RecipeExample> cookbook;

  // 构造函数（需要子类实现）
  const BaseRecipe({
    required this.id,
    required this.name,
    required this.method,
    required this.priority,
    required this.imageUrl,
    required this.health,
    required this.hunger,
    required this.sanity,
    required this.cookTime,
    required this.desc,
    required this.freshness,
    required this.favorites,
    required this.sideEffect,
    required this.condition,
    required this.notContain,
    required this.cookbook,
  });

  /// 抽象方法：验证食材是否符合条件
  /// 参数：ingredients - 用户选择的食材列表
  bool matches(List<String> ingredientIds);
}