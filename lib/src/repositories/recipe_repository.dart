import 'package:dst_wok/src/models/crockpot_recipe.dart';
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
    ...portableCookerRecipe,
  ];

  /// 根据烹饪方式获取食谱列表
  List<BaseRecipe> getByMethod(CookingMethod method) {
    return _allRecipes.where((recipe) => recipe.method == method).toList()
      ..sort((a, b) => b.priority.compareTo(a.priority));
  }

  // 根据烹饪方式和关键词获取过滤后的食谱列表
  List<BaseRecipe> searchRecipes(CookingMethod method, String keyword) {
    if (keyword.isEmpty) {
      // 如果关键词为空，返回该方法下的所有食谱
      return getByMethod(method);
    } else {
      final lowerCaseKeyword = keyword.toLowerCase();
      return _allRecipes
          .where(
            (recipe) =>
                recipe.method == method &&
                recipe.name.toLowerCase().contains(lowerCaseKeyword),
          )
          .toList()
        ..sort((a, b) => b.priority.compareTo(a.priority));
    }
  }

  // 新增方法：获取所有食谱列表 (如果其他地方需要)
  List<BaseRecipe> getAllRecipes() {
    return _allRecipes;
  }

}
