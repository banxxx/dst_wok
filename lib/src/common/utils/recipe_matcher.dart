import '../../models/base_recipe.dart';
import '../../repositories/constants/game_assets.dart';

class RecipeMatcher {
  final List<BaseRecipe> recipes;

  RecipeMatcher(this.recipes);

  /// 根据食材找到匹配的配方
  List<BaseRecipe> findMatchingRecipes(List<Ingredient> ingredients) {
    if (ingredients.length != 4) return [];

    List<BaseRecipe> matchingRecipes = [];

    for (var recipe in recipes) {
      if (recipe.matches(ingredients)) {
        matchingRecipes.add(recipe);
      }
    }

    // 按优先级排序，优先级高的在前
    matchingRecipes.sort((a, b) => b.priority.compareTo(a.priority));

    return matchingRecipes;
  }

  /// 获取最佳匹配的配方（优先级最高的）
  BaseRecipe? getBestMatch(List<Ingredient> ingredients) {
    final matches = findMatchingRecipes(ingredients);
    return matches.isNotEmpty ? matches.first : null;
  }

  /// 验证配方匹配算法
  void validateRecipe(BaseRecipe recipe) {
    print('验证配方: ${recipe.name}');

    for (var example in recipe.cookbook) {
      final ingredients = example.ingredients.map((pos) => pos).toList();
      final matches = recipe.matches(ingredients);

      if (matches) {
        print('  ✓ 配方示例匹配成功: ${ingredients.map((i) => i.displayName).join(', ')}');
      } else {
        print('  ✗ 配方示例匹配失败: ${ingredients.map((i) => i.displayName).join(', ')}');
      }
    }
  }

  /// 批量验证所有配方
  void validateAllRecipes() {
    for (var recipe in recipes) {
      validateRecipe(recipe);
    }
  }
}