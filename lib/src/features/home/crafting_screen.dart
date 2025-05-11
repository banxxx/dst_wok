import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routes/route_names.dart';
import '../../common/enums/cooking_method.dart';
import '../drawer/app_end_drawer.dart';
import 'method_selector.dart';
import '../../models/base_recipe.dart';
import '../../repositories/recipe_repository.dart';
import 'recipe_selector.dart';

/// 自定义顶部按钮组件
class CraftingScreen extends StatefulWidget {
  const CraftingScreen({super.key});

  @override
  State<CraftingScreen> createState() => _CraftingScreenState();
}

class _CraftingScreenState extends State<CraftingScreen> {
  // 当前选中的烹饪方式（默认烹饪锅）
  CookingMethod _currentMethod = CookingMethod.crockPot;
  late PageController _pageController; // 新增页面控制器

  // 数据仓库实例
  final _repo = RecipeRepository();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentMethod.index, // 初始页面对应方法索引
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // 高度
        // 烹饪方式选择区域
        title: MethodSelector(
          currentMethod: _currentMethod,
          onMethodChanged: _updateMethodWithAnimation,
        ),
        centerTitle: false, // 关闭居中
        actions: [
          // 在右上角添加抽屉按钮
          Builder(
            builder:
                (context) => IconButton(
                  icon: Image.asset('assets/setting/drawer.png', width: 38),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
          ),
        ],
      ),
      endDrawer: const AppEndDrawer(),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) => _updateMethod(CookingMethod.values[index]),
        itemCount: CookingMethod.values.length,
        itemBuilder: (context, index) => _buildRecipePage(index),
      ),
    );
  }

  Widget _buildRecipePage(int index) {
    final method = CookingMethod.values[index];
    return RecipeSelector(
      key: PageStorageKey(method),
      selectedMethod: method,
      recipes: _repo.getByMethod(method),
      onSelect: _handleSelectRecipe,
    );
  }

  // 带动画的更新方法
  void _updateMethodWithAnimation(CookingMethod newMethod) {
    if (_currentMethod == newMethod) return;
    _pageController.animateToPage(
      newMethod.index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // 同步更新方法
  void _updateMethod(CookingMethod newMethod) {
    if (_currentMethod == newMethod) return;
    setState(() => _currentMethod = newMethod);
  }

  void _handleSelectRecipe(BaseRecipe selectedRecipe) {
    if (CookingMethod.campfire == selectedRecipe.method) {
      context.pushNamed(
        RouteNames.recipeDetailsCampfire,
        extra: selectedRecipe, // 传递数据
      );
    } else {
      context.pushNamed(
        RouteNames.recipeDetails,
        extra: selectedRecipe, // 传递数据
      );
    }
  }
}
