import 'package:dst_wok/src/repositories/data/portableCooker_recipes.dart';

import '../common/enums/cooking_method.dart';
import '../models/base_recipe.dart';
import 'data/campfire_recipes.dart';
import 'data/crockpot_recipes.dart';

/// 食谱数据管理中心
class RecipeRepository {
  /// 合并所有食谱数据
  final List<BaseRecipe> _allRecipes = [
    ...campfireRecipes,
    ...crockpotRecipes,
    ...portableCookerRecipe
  ];

  /// 根据烹饪方式获取食谱列表
  List<BaseRecipe> getByMethod(CookingMethod method) {
    return _allRecipes
        .where((recipe) => recipe.method == method)
        .toList()
      ..sort((a, b) => b.priority.compareTo(a.priority));
  }
}