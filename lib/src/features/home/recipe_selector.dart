import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../common/constants/custom_colors.dart';
import '../../common/enums/cooking_method.dart';
import '../../models/base_recipe.dart';

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
    final media = MediaQuery.of(context);
    final isTablet = _isTabletDevice(media);

    return GridView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _calculateCrossAxisCount(media, isTablet),
        childAspectRatio: _getAspectRatio(context),
        mainAxisSpacing: Platform.isWindows ? 12 : 8,
        crossAxisSpacing: Platform.isWindows ? 12 : 8,
      ),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      itemCount: recipes.length,
      itemBuilder:
          (context, index) => _RecipeCard(
            // 优化点1：独立卡片组件
            recipe: recipes[index],
            selectedMethod: selectedMethod,
            onSelect: onSelect,
          ),
    );
  }

  /// 判断是否为平板设备
  bool _isTabletDevice(MediaQueryData media) {
    // 方法一：物理尺寸检测
    final physicalSize = media.size * media.devicePixelRatio;
    final diagonalInches =
        sqrt(pow(physicalSize.width, 2) + pow(physicalSize.height, 2)) / 160;

    return diagonalInches >= 7;
  }

  /// 动态计算列数
  int _calculateCrossAxisCount(MediaQueryData media, bool isTablet) {
    final screenWidth = media.size.width;

    // Windows平台特殊处理
    if (Platform.isWindows) {
      // 当窗口宽度<=手机宽度时强制单列显示
      return screenWidth <= 420 ? 1 : _calculateDesktopColumns(screenWidth);
    }

    // 平板逻辑
    return !isTablet ? 1 : _calculateTabletColumns(screenWidth);
  }

  /// 桌面端列数计算
  int _calculateDesktopColumns(double screenWidth) {
    if (screenWidth > 1200) return 3;
    if (screenWidth > 800) return 2;
    return 1;
  }

  /// 平板列数计算
  int _calculateTabletColumns(double screenWidth) {
    if (screenWidth > 1200) return 3;
    if (screenWidth > 700) return 2;
    return 1;
  }

  /// 动态宽高比计算
  double _getAspectRatio(BuildContext context) {
    return 2.5;
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
    // 计算内边距，等于 Border 宽度加上 Border 距离卡片边缘的距离
    // 内圈 Border 宽度为 2，我们希望它距离卡片边缘有 6 像素的距离
    // 所以 Padding 需要为 6 + 2 = 8 像素
    const double innerBorderMargin = 6.0; // 内圈 Border 距离卡片边缘的距离
    const double innerBorderWidth = 2.0; // 内圈 Border 的宽度
    const double contentPadding =
        innerBorderMargin + innerBorderWidth; // 内容区域的 Padding

    return Card(
      color: _CardStyle.cardColor(context),
      elevation: _CardStyle.elevation,
      shape: _CardStyle.cardShape(context),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            // 内容区域填充，并添加 Padding
            child: Padding(
              padding: const EdgeInsets.all(contentPadding), // 应用计算出的 Padding
              child: _buildInteractiveArea(),
            ),
          ),
          // 将装饰层放在顶部（覆盖在内容上方）并填充整个空间
          // IgnorePointer 确保它不干扰手势
          const Positioned.fill(
            child: IgnorePointer(
              child: _CardDecorationLayer(
                // 将 innerBorderMargin 传递给装饰层
                margin: innerBorderMargin,
                borderWidth: innerBorderWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveArea() {
    return GestureDetector(
      // 替换InkWell减少重绘
      onTap: () => onSelect(recipe),
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          _LeftSection(recipe: recipe), // 独立左侧区域
          _RightSection(
            // 独立右侧区域
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
  static const double elevation = 3;

  static Color cardColor(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return customColors!.recipeSelectorBg;
  }

  static ShapeBorder cardShape(BuildContext context) {
    // 获取当前主题的自定义颜色
    final customColors = Theme.of(context).extension<CustomColors>();
    final borderColor = customColors!.recipeSelectorBorderOut;

    // 返回带有圆角和边框的形状
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(
        color: borderColor,
        width: 3.2, // 外边框宽度
      ),
    );
  }
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
        color: Theme.of(context).extension<CustomColors>()!.recipeSelectorBorderIn,
        strokeWidth: 2,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: _RecipeContent(recipe: recipe),
      ),
    );
  }

  /// 虚线路径生成（保留原注释）
  static Path _dashPath(Size size) =>
      Path()
        ..moveTo(size.width, 1) // 起点（右上角向下8px）
        ..lineTo(size.width, size.height - 1); // 终点（右下角向上8px）
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              // Center 来居中图片
              child: _OptimizedImage(imageUrl: recipe.imageUrl),
            ),
          ),
          const SizedBox(height: 8), // 间隔仍然是固定高度
          // 将 _RecipeName 包裹在 Expanded 中，并设置 flex 为 1
          Expanded(
            flex: 1,
            child: _RecipeName(
              name: recipe.name,
            ), // 它的高度现在由 Expanded(flex: 1) 决定
          ),
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
        maxWidth: 70, // 最大宽度限制
        maxHeight: 70, // 最大高度限制
      ),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.contain, // 关键属性：保持比例缩放
        cacheWidth: 80 * MediaQuery.of(context).devicePixelRatio ~/ 1,
        cacheHeight: 80 * MediaQuery.of(context).devicePixelRatio ~/ 1,
        filterQuality: FilterQuality.low,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        // Stack 的最大宽度就是 LayoutBuilder 的约束宽度
        final double stackWidth = constraints.maxWidth;
        // 背景图的有效宽度是 Stack 宽度的 80% (根据 FractionallySizedBox 的设置)
        final double backgroundImageEffectiveWidth = stackWidth * 0.8;
        return Stack(
          alignment: Alignment.center,
          children: [
            // _BackgroundImage 仍然按照之前的逻辑布局
            Positioned.fill(
              child: Align(
                child: FractionallySizedBox(
                  widthFactor: 0.8, // 宽度是父容器 (Stack) 宽度的 80%
                  child: _BackgroundImage(),
                ),
              ),
            ),
            // 将文字包裹在 TextSizer 中，并限制其最大宽度
            // 同时传入计算出的目标宽度
            Positioned.fill(
              // Positioned.fill 确保文字区域也填充 Stack 空间
              child: Align(child: _buildTextLabel(context)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextLabel(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown, // 缩小文本以适应空间
      alignment: Alignment.center, // 文本居中
      child: Text(
        name,
        style: _defaultTextStyle(context),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        textScaleFactor: 1.0, // 禁止系统缩放
      ),
    );
  }

  // 默认文字样式（私有方法）
  static TextStyle _defaultTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700, // 稳定字体渲染
      color: Theme.of(context).extension<CustomColors>()!.recipeTitle,
    ).copyWith(
      fontFeatures: const [FontFeature.tabularFigures()], // 优化文本渲染性能
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
      color: Theme.of(context).extension<CustomColors>()!.bannerBg,
      fit: BoxFit.fill, // 填充父容器提供的空间
    );
  }
}

/// ---------------------- 右侧内容区域 ----------------------
class _RightSection extends StatelessWidget {
  final BaseRecipe recipe;
  final CookingMethod selectedMethod;

  const _RightSection({required this.recipe, required this.selectedMethod});

  @override
  Widget build(BuildContext context) {
    // 根据烹饪方式和食谱的实际类型来决定显示哪个部分
    final Widget ingredientsWidget = recipe.buildIngredientsWidget();

    return Expanded(
      flex: 2, // 占横向2/3比例
      child: Column(
        children: [
          Expanded(
            // 将 ingredientsWidget 包裹在 Expanded 中以占用剩余空间
            flex: 50, // 与原来的比例一致
            child: ingredientsWidget,
          ),
          Expanded(
            // 将状态指示器也包裹在 Expanded 中
            flex: 40, // 与原来的比例一致
            child: _StatusIndicators(
              health: recipe.health,
              hunger: recipe.hunger,
              sanity: recipe.sanity,
            ),
          ),
        ],
      ),
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
    return Container(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatusIndicator(imagePath: 'status_health_64', value: health),
          _StatusIndicator(imagePath: 'status_hunger_64', value: hunger),
          _StatusIndicator(imagePath: 'status_sanity_64', value: sanity),
        ],
      ),
    );
  }
}

/// ---------------------- 单个状态指示器 ----------------------
class _StatusIndicator extends StatelessWidget {
  final String imagePath;
  final double value;

  const _StatusIndicator({required this.imagePath, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    return Align(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Image.asset(
          'assets/setting/$imagePath.png',
          fit: BoxFit.contain, // 根据可用空间缩放
          // cacheWidth 和 cacheHeight 仍然可以保留进行优化
          cacheWidth:
              (64 * 0.6 * MediaQuery.of(context).devicePixelRatio)
                  .round(), // 根据示例计算缓存尺寸
          cacheHeight:
              (96 * MediaQuery.of(context).devicePixelRatio)
                  .round(), // 根据示例计算缓存尺寸
        ),
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        widthFactor: 0.6, // 示例：数值背景宽度占父容器的 80%
        heightFactor: 0.4, // 示例：数值背景高度占父容器的 30%
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
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).extension<CustomColors>()!.recipeTitle,
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
  // 接收 Border 的 margin 和 width 参数
  final double margin;
  final double borderWidth;

  const _CardDecorationLayer({
    this.margin = 6.0, // 默认值
    this.borderWidth = 2.0, // 默认值
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        margin: EdgeInsets.all(margin), // 应用 margin
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.fromBorderSide(
            BorderSide(
              color: Theme.of(context).extension<CustomColors>()!.recipeSelectorBorderIn,
              width: borderWidth,
            ), // 应用 Border 宽度
          ),
        ),
      ),
    );
  }
}
