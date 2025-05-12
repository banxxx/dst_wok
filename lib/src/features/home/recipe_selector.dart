import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/widgets/ingredient_utils.dart';
import '../../models/base_recipe.dart';
import '../../common/enums/cooking_method.dart';
import '../../models/recipe_example.dart';

/// 配方展示网格组件
class RecipeSelector extends StatelessWidget {
  /// 当前选中的烹饪方式
  final CookingMethod selectedMethod;

  /// 食谱列表
  final List<BaseRecipe> recipes;

  /// 选中回调
  final Function(BaseRecipe) onSelect;

  const RecipeSelector({
    super.key,
    required this.selectedMethod,
    required this.recipes,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // 每行显示2个卡片
        childAspectRatio: 2.5, // 调整宽高比
        mainAxisSpacing: 8, // 垂直间距
        crossAxisSpacing: 8, // 水平间距
      ),
      padding: const EdgeInsets.all(8),
      itemCount: recipes.length,
      itemBuilder: (context, index) => _RecipeCard( // 优化点1：独立卡片组件
        recipe: recipes[index],
        selectedMethod: selectedMethod,
        onSelect: onSelect,
      ),
    );
  }
}

/// ---------------------- 拆分后的卡片组件 ----------------------
class _RecipeCard extends StatelessWidget {
  final BaseRecipe recipe;
  final CookingMethod selectedMethod;
  final Function(BaseRecipe) onSelect;

  const _RecipeCard({
    required this.recipe,
    required this.selectedMethod,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _CardStyle.cardColor,
      elevation: _CardStyle.elevation,
      shape: _CardStyle.cardShape,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildInteractiveArea(),
          const _CardDecorationLayer(), // 独立装饰层
        ],
      ),
    );
  }

  Widget _buildInteractiveArea() {
    return GestureDetector( // 替换InkWell减少重绘
      onTap: () => onSelect(recipe),
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          _LeftSection(recipe: recipe), // 独立左侧区域
          _RightSection( // 独立右侧区域
            recipe: recipe,
            selectedMethod: selectedMethod,
          ),
        ],
      ),
    );
  }
}

/// ---------------------- 样式常量 ----------------------
class _CardStyle {
  static const Color cardColor = AppColors.recipeSelectorBg;
  static const double elevation = 3;
  static final ShapeBorder cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    side: const BorderSide(
      color: AppColors.recipeSelectorBorderOut,
      width: 3.2,
    ),
  );
}

/// ---------------------- 左侧图片区域 ----------------------
class _LeftSection extends StatelessWidget {
  final BaseRecipe recipe;

  const _LeftSection({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1, // 占横向1/3比例
      child: DottedBorder(
        customPath: _dashPath, // 缓存路径计算
        dashPattern: const [4, 4],
        radius: const Radius.circular(24),
        color: AppColors.recipeSelectorBorderIn,
        strokeWidth: 2,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: _RecipeContent(recipe: recipe),
      ),
    );
  }

  /// 虚线路径生成（保留原注释）
  static Path _dashPath(Size size) => Path()
    ..moveTo(size.width, 16) // 起点（右上角向下8px）
    ..lineTo(size.width, size.height - 16); // 终点（右下角向上8px）
}

/// ---------------------- 左侧内容区域 ----------------------
class _RecipeContent extends StatelessWidget {
  final BaseRecipe recipe;

  const _RecipeContent({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _OptimizedImage(imageUrl: recipe.imageUrl), // 优化图片加载
          const SizedBox(height: 8),
          _RecipeName(name: recipe.name),
        ],
      ),
    );
  }
}

/// ---------------------- 优化后的图片组件 ----------------------
class _OptimizedImage extends StatelessWidget {
  final String imageUrl;

  const _OptimizedImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 80, // 最大宽度限制
        maxHeight: 80, // 最大高度限制
      ),
      child: Center(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.contain, // 关键属性：保持比例缩放
          cacheWidth: 160, // 指定缓存分辨率
          cacheHeight: 160,
          filterQuality: FilterQuality.low,
        ),
      ),
    );
  }
}

/// ---------------------- 菜谱名称组件 ----------------------
class _RecipeName extends StatelessWidget {
  final String name;

  const _RecipeName({required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100, // 保持与图片相同的宽度约束
      child: Stack(
        alignment: Alignment.center,
        children: [
          const _BackgroundImage(),
          _NameText(name: name),
        ],
      ),
    );
  }
}

/// ---------------------- 背景图片组件 ----------------------
class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/setting/bg.png',
      width: 100,
      cacheWidth: 200, // 预缓存背景图
      cacheHeight: 200,
    );
  }
}

/// ---------------------- 名称文字组件 ----------------------
class _NameText extends StatelessWidget {
  final String name;

  const _NameText({required this.name});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.recipeTitle, // 根据背景色调整文字颜色
          ),
          textAlign: TextAlign.center, // 文字居中
        ),
      ),
    );
  }
}

/// ---------------------- 右侧内容区域 ----------------------
class _RightSection extends StatelessWidget {
  final BaseRecipe recipe;
  final CookingMethod selectedMethod;

  const _RightSection({
    required this.recipe,
    required this.selectedMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2, // 占横向2/3比例
      child: Column(
        children: [
          if (selectedMethod != CookingMethod.campfire)
            _CookpotIngredients(slots: recipe.cookbook.first.slots),
          _StatusIndicators(
            health: recipe.health,
            hunger: recipe.hunger,
            sanity: recipe.sanity,
          ),
        ],
      ),
    );
  }
}

/// ---------------------- 烹饪锅食材组件 ----------------------
class _CookpotIngredients extends StatelessWidget {
  final List<PositionalIngredient> slots;

  const _CookpotIngredients({required this.slots});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 52,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate( // 避免动态扩展操作符
            slots.length * 2 - 1,
                (index) => index.isEven
                ? _buildIngredient(slots[index ~/ 2])
                : _buildPlusIcon(),
          ),
        ),
      ),
    );
  }

  Widget _buildIngredient(PositionalIngredient slot) {
    return IngredientUtils.buildIngredientWidget(
      ingredient: slot.ingredient,
      imageSize: 32,
      containerSize: 42,
    );
  }

  Widget _buildPlusIcon() {
    return IngredientUtils.buildAddIcon(
      containerSize: 42, // 与图片容器高度一致
      horizontalPadding: 2,
    );
  }
}

/// ---------------------- 状态指示器行 ----------------------
class _StatusIndicators extends StatelessWidget {
  final double health;
  final double hunger;
  final double sanity;

  const _StatusIndicators({
    required this.health,
    required this.hunger,
    required this.sanity,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 38,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _StatusIndicator(imagePath: 'status_health_64', value: health),
            _StatusIndicator(imagePath: 'status_hunger_64', value: hunger),
            _StatusIndicator(imagePath: 'status_sanity_64', value: sanity),
          ],
        ),
      ),
    );
  }
}

/// ---------------------- 单个状态指示器 ----------------------
class _StatusIndicator extends StatelessWidget {
  final String imagePath;
  final double value;

  const _StatusIndicator({
    required this.imagePath,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 96,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _StatusIcon(imagePath: imagePath),
          _ValueIndicator(value: value),
        ],
      ),
    );
  }
}

/// ---------------------- 状态图标组件 ----------------------
class _StatusIcon extends StatelessWidget {
  final String imagePath;

  const _StatusIcon({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Image.asset(
        'assets/setting/$imagePath.png',
        width: 38,
        height: 38,
        cacheWidth: 76, // 2倍图预缩放
        cacheHeight: 76,
      ),
    );
  }
}

/// ---------------------- 数值指示器组件 ----------------------
class _ValueIndicator extends StatelessWidget {
  final double value;

  const _ValueIndicator({required this.value});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      child: SizedBox(
        width: 54,
        height: 22,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/setting/value_gold.png',
              fit: BoxFit.fill,
              color: Colors.transparent, // 禁用颜色混合
              colorBlendMode: BlendMode.dstOver,
            ),
            Center(
              child: Text(
                '$value',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.recipeTitle,
                  fontWeight: FontWeight.w500, // 稳定字体渲染
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------- 卡片装饰层 ----------------------
class _CardDecorationLayer extends StatelessWidget {
  const _CardDecorationLayer();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: RepaintBoundary(
        child: IgnorePointer(
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: const Border.fromBorderSide(
                BorderSide(color: AppColors.recipeSelectorBorderIn, width: 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
