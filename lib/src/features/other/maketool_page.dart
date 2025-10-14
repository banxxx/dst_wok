import 'package:flutter/material.dart';

import '../../common/constants/custom_colors.dart';
import '../../common/utils/recipe_matcher.dart';
import '../../common/widgets/custom_appBar.dart';
import '../../models/base_recipe.dart';
import '../../repositories/constants/game_assets.dart';
import '../../repositories/recipe_repository.dart';

class MaketoolPage extends StatefulWidget {
  const MaketoolPage({super.key});

  @override
  _MaketoolPageState createState() => _MaketoolPageState();
}

class _MaketoolPageState extends State<MaketoolPage> {
  // 存储选中的食材
  List<Ingredient?> selectedIngredients = List.filled(4, null);

  // 当前选中的食材数量
  int selectedCount = 0;

  // 合成的食谱
  BaseRecipe? resultRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('食谱合成'),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Column(
        children: [
          // 上半部分：合成区域
          Container(
            padding: EdgeInsets.all(16),
            // color: Theme.of(context).extension<CustomColors>()!.recipeSelectorBg,
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 前四个食材框
                    ...List.generate(4, (index) => _buildIngredientSlot(index)),
                    // 等号
                    Icon(Icons.arrow_forward, size: 30, color: Theme.of(context).extension<CustomColors>()!.recipeSelectorBorderOut),
                    // 结果框
                    _buildResultSlot(),
                  ],
                ),
                SizedBox(height: 16),
                // 重置按钮
                ElevatedButton(
                  onPressed: _resetRecipe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[600],
                    foregroundColor: Colors.white,
                  ),
                  child: Text('重置'),
                ),
              ],
            ),
          ),

          // 分割线
          Divider(thickness: 2, color: Theme.of(context).extension<CustomColors>()!.recipeSelectorBorderOut),

          // 下半部分：食材选择区域
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '选择食材 (${selectedCount}/4)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).extension<CustomColors>()!.recipeTitle,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1,
                      ),
                      itemCount: GameAssets.defaultIngredients.length,
                      itemBuilder: (context, index) {
                        return _buildIngredientCard(GameAssets.defaultIngredients[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建食材槽位
  Widget _buildIngredientSlot(int index) {
    final ingredient = selectedIngredients[index];

    return GestureDetector(
      onTap: () => _removeIngredient(index),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).extension<CustomColors>()!.recipeSelectorBorderOut, width: 2),
          borderRadius: BorderRadius.circular(8),
          color: ingredient != null ? Theme.of(context).cardColor : Theme.of(context).extension<CustomColors>()!.recipeSelectorBg,
        ),
        child: ingredient != null
            ? Center(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Image.asset(
              ingredient.imageAsset,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image_not_supported,
                    color: Colors.grey[400], size: 30);
              },
            ),
          ),
        )
            : Icon(Icons.add, color: Colors.grey[400], size: 30),
      ),
    );
  }

  // 构建结果槽位
  Widget _buildResultSlot() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).extension<CustomColors>()!.recipeSelectorBorderOut, width: 3),
        borderRadius: BorderRadius.circular(8),
        color: resultRecipe != null ? Theme.of(context).cardColor : Theme.of(context).extension<CustomColors>()!.recipeSelectorBg,
      ),
      child: resultRecipe != null
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 使用 Image.asset 显示食谱图片
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                resultRecipe!.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.restaurant,
                      color: Colors.orange[400], size: 32);
                },
              ),
            ),
          ),
          Text(
            resultRecipe!.name,
            style: TextStyle(
              fontSize: 10,
              color: Theme.of(context).extension<CustomColors>()!.recipeTitle,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      )
          : Icon(Icons.restaurant, color: Colors.grey[400], size: 40),
    );
  }

  // 构建食材卡片
  Widget _buildIngredientCard(Ingredient ingredient) {
    return GestureDetector(
      onTap: () => _selectIngredient(ingredient),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).extension<CustomColors>()!.recipeSelectorBorderOut, width: 2),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).extension<CustomColors>()!.recipeSelectorBorderIn,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 使用 Image.asset 显示食材图片
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  ingredient.imageAsset,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image_not_supported,
                        color: Colors.grey[400], size: 24);
                  },
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                ingredient.displayName,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).extension<CustomColors>()!.recipeTitle,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  // 选择食材
  void _selectIngredient(Ingredient ingredient) {
    if (selectedCount < 4) {
      setState(() {
        selectedIngredients[selectedCount] = ingredient;
        selectedCount++;
        _checkRecipe();
      });
    }
  }

  // 移除食材
  void _removeIngredient(int index) {
    if (selectedIngredients[index] != null) {
      setState(() {
        // 移除指定位置的食材，并将后面的食材前移
        for (int i = index; i < 3; i++) {
          selectedIngredients[i] = selectedIngredients[i + 1];
        }
        selectedIngredients[3] = null;
        selectedCount--;
        _checkRecipe();
      });
    }
  }

  // 检查食谱
  void _checkRecipe() {
    if (selectedCount == 4) {
      // 获取选中食材的类型
      List<String> selectedTypes = selectedIngredients
          .map((ingredient) => ingredient!.id)
          .toList();

      // 查找匹配的食谱
      BaseRecipe? foundRecipe = _findMatchingRecipe(selectedIngredients);

      setState(() {
        resultRecipe = foundRecipe!;
      });
    }
    else {
      setState(() {
        resultRecipe = null;
      });
    }
  }

  // 查找匹配的食谱
  BaseRecipe? _findMatchingRecipe(List<Ingredient?> ingredientIds) {
    // 创建配方匹配器
    final matcher = RecipeMatcher(RecipeRepository().getAllRecipes());
    final bestMatch = matcher.getBestMatch(ingredientIds.map((e) => e!).toList());
    return bestMatch;
  }

  // 重置食谱
  void _resetRecipe() {
    setState(() {
      selectedIngredients = List.filled(4, null);
      selectedCount = 0;
      resultRecipe = null;
    });
  }
}