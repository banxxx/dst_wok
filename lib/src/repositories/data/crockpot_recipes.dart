import '../../models/recipe_example.dart';
import '../constants/GameAssets.dart';
import '../../common/enums/character.dart';
import '../../models/crockpot_recipe.dart';
import '../../common/enums/ingredient_tag.dart';

/// 预定义的烹饪锅配方数据
/// id: 食物ID
/// name: 食物名称
/// requiredTags: 必须满足的标签条件
/// fillerSlots: 填充位数量
/// priority: 优先级（数值越大越优先匹配）
/// imageUrl: 配方图片资源路径
/// health: 生命值
/// hunger: 饥饿值
/// sanity: san值
/// cookTime: 烹饪所需时间
/// freshness: 保质期
/// desc: 补充说明
/// favorites: 偏好角色
/// sideEffect: 副作用(文字描述)
/// condition: 烹饪条件(文字描述)
/// notContain: 不能包含(文字描述)
/// cookbook: 菜谱示例
var crockpotRecipes = [
  CrockpotRecipe(
      id: 'meatballs',
      name: '肉丸',
      requiredTags: const {IngredientTag.meat: 0.5},
      fillerSlots: 4,
      priority: -1,
      imageUrl: 'assets/crockPot/meatballs.png',
      health: 3,
      hunger: 62.5,
      sanity: 5,
      cookTime: '15',
      freshness: '10',
      desc: '',
      favorites: const {},
      sideEffect: '',
      condition: '测试图片[img:berries]测试图片[img:carrot]',
      notContain: '',
      cookbook: [
        RecipeExample(
        slot1: PositionalIngredient(
        ingredient: GameAssets.meat),
        slot2: PositionalIngredient(
        ingredient: GameAssets.berries),
        slot3: PositionalIngredient(
        ingredient: GameAssets.berries),
        slot4: PositionalIngredient(
        ingredient: GameAssets.berries),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.meat),
          slot2: PositionalIngredient(
              ingredient: GameAssets.berries),
          slot3: PositionalIngredient(
              ingredient: GameAssets.berries),
          slot4: PositionalIngredient(
              ingredient: GameAssets.berries),
        ),
        RecipeExample(
          slot1: PositionalIngredient(
              ingredient: GameAssets.meat),
          slot2: PositionalIngredient(
              ingredient: GameAssets.berries),
          slot3: PositionalIngredient(
              ingredient: GameAssets.berries),
          slot4: PositionalIngredient(
              ingredient: GameAssets.berries),
        )
      // 更多菜谱示例...
      ]
  ),
  CrockpotRecipe(
      id: 'turkeydinner',
      name: '火鸡正餐',
      requiredTags: {IngredientTag.meat: 0.5},
      fillerSlots: 4,
      priority: 1,
      imageUrl: 'assets/crockPot/turkeydinner.png',
      health: 3,
      hunger: 62.5,
      sanity: 5,
      cookTime: '15',
      freshness: '10',
      desc: '',
      favorites: {},
      sideEffect: '',
      condition: '',
      notContain: '',
      cookbook: [RecipeExample(
        slot1: PositionalIngredient(
            ingredient: GameAssets.drumstick),
        slot2: PositionalIngredient(
            ingredient: GameAssets.drumstick),
        slot3: PositionalIngredient(
            ingredient: GameAssets.monstermeat),
        slot4: PositionalIngredient(
            ingredient: GameAssets.carrot),
      )]
  ),
  CrockpotRecipe(
      id: 'turkeydinner',
      name: '火鸡正餐',
      requiredTags: {IngredientTag.meat: 0.5},
      fillerSlots: 4,
      priority: 1,
      imageUrl: 'assets/crockPot/turkeydinner.png',
      health: 3,
      hunger: 62.5,
      sanity: 5,
      cookTime: '15',
      freshness: '10',
      desc: '测试字段',
      favorites: {},
      sideEffect: '',
      condition: '',
      notContain: '',
      cookbook: [RecipeExample(
        slot1: PositionalIngredient(
            ingredient: GameAssets.drumstick),
        slot2: PositionalIngredient(
            ingredient: GameAssets.drumstick),
        slot3: PositionalIngredient(
            ingredient: GameAssets.monstermeat),
        slot4: PositionalIngredient(
            ingredient: GameAssets.carrot),
      )]
  ),
  CrockpotRecipe(
      id: 'turkeydinner',
      name: '火鸡正餐',
      requiredTags: {IngredientTag.meat: 0.5},
      fillerSlots: 4,
      priority: 1,
      imageUrl: 'assets/crockPot/turkeydinner.png',
      health: 3,
      hunger: 62.5,
      sanity: 5,
      cookTime: '15',
      freshness: '10',
      desc: '测试字段111111',
      favorites: {Character.Wilson},
      sideEffect: '',
      condition: '',
      notContain: '',
      cookbook: [RecipeExample(
        slot1: PositionalIngredient(
            ingredient: GameAssets.drumstick),
        slot2: PositionalIngredient(
            ingredient: GameAssets.drumstick),
        slot3: PositionalIngredient(
            ingredient: GameAssets.monstermeat),
        slot4: PositionalIngredient(
            ingredient: GameAssets.carrot),
      )]
  ),
];