import 'package:flutter/material.dart';

import '../../repositories/constants/game_assets.dart';
import '../constants/app_colors.dart';

class IngredientUtils {
  /// 通用食材图片构建方法
  static Widget buildIngredientWidget({
    required Ingredient? ingredient,
    int flex = 1, // 新增 flex 参数
    TextStyle? textStyle, // 可选自定义文字样式
  }) {
    if (ingredient == null) {
      return Expanded(flex: flex, child: const SizedBox.shrink());
    }

    return Expanded(
      // 改用约束盒子
      flex: flex,
      child: Padding(
        // 添加 Padding 作为内部间距
        padding: const EdgeInsets.symmetric(horizontal: 4), // 示例：水平间距
        child: _IngredientContent(
          // 拆分内部组件
          ingredient: ingredient,
          // imageSize: imageSize,
          // containerSize: containerSize,
          textStyle: textStyle,
        ),
      ),
    );
  }

  // 默认文字样式（私有方法）
  static TextStyle _defaultTextStyle() {
    return const TextStyle(fontSize: 12, color: AppColors.recipeTitle).copyWith(
      fontFeatures: const [FontFeature.tabularFigures()], // 优化文本渲染性能
    );
  }

  /// 加号图标构建方法
  static Widget buildAddIcon({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: const Alignment(0.0, -0.5), // 水平居中，垂直向上移动，数值需要微调
        child: RepaintBoundary(
          child: Image.asset(
            'assets/setting/add.png',
            fit: BoxFit.contain, // 根据可用空间缩放
            alignment: Alignment.topCenter,
            // cacheWidth 和 cacheHeight 仍然可以保留进行优化，但需要根据实际渲染尺寸调整
            // 这里的缓存尺寸可以考虑设置为一个合理的最大值，或者根据父容器尺寸动态计算（更复杂）
            cacheWidth: (16 * 2).round(), // 示例：假设在常见的最小尺寸下需要 16px
            cacheHeight: (16 * 2).round(),
          ),
        ),
      ),
    );
  }
}

/// -------------------- 内部组件拆分 --------------------
class _IngredientContent extends StatelessWidget {
  final Ingredient? ingredient;
  final TextStyle? textStyle;

  const _IngredientContent({required this.ingredient, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 动态计算组件高度
        final containerHeight = constraints.maxHeight;
        final imageSize = containerHeight * 0.7; // 图片占70%高度
        final textHeight = containerHeight * 0.3; // 文本占30%高度

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 图片区域
            SizedBox(
              height: imageSize,
              child: AspectRatio(
                aspectRatio: 1, // 保持正方形
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/setting/inv_item_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: 0.7, // 宽度占容器70%
                    heightFactor: 0.7, // 高度占容器70%
                    child: Image.asset(
                      ingredient!.imageAsset,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            // 文本区域
            SizedBox(
              height: textHeight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  ingredient!.displayName,
                  style: textStyle ?? const TextStyle(
                    fontSize: 12,
                    color: AppColors.recipeTitle,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// 图片容器（添加缓存策略）
  Widget _buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
        image: _BackgroundCache.getImage(), // 使用缓存装饰图
      ),
      child: RepaintBoundary(
        // 避免连带重绘
        child: Center(
          child: FractionallySizedBox(
            // 使用 FractionallySizedBox 设置图片占容器的比例
            widthFactor: 0.8, // 示例：图片宽度占容器的 80%
            heightFactor: 0.8, // 示例：图片高度占容器的 80%
            child: Image.asset(
              ingredient!.imageAsset,
              fit: BoxFit.contain, // 根据可用空间缩放
              // 缓存尺寸需要根据比例和容器大小动态计算，或者设置为一个合理的最大值
              // 这里的示例仍然使用了之前的值，你可能需要根据实际情况调整
              cacheWidth: (32 * 2).round(),
              cacheHeight: (32 * 2).round(),
              filterQuality: FilterQuality.low, // 降低过滤质量
              isAntiAlias: false, // 关闭抗锯齿
              excludeFromSemantics: true, // 跳过语义分析
            ),
          ),
        ),
      ),
    );
  }

  /// 文本标签（添加布局约束）
  Widget _buildTextLabel() {
    return Container(
      alignment: Alignment.topCenter, // 顶部对齐
      child: FittedBox(
        fit: BoxFit.scaleDown, // 缩小文本以适应空间
        alignment: Alignment.center, // 文本居中
        child: Text(
          ingredient!.displayName,
          style: textStyle ?? IngredientUtils._defaultTextStyle(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          textScaleFactor: 1.0, // 禁止系统缩放
        ),
      ),
    );
  }
}

/// -------------------- 背景图缓存管理器 --------------------
class _BackgroundCache {
  static DecorationImage? _cachedImage;

  static DecorationImage getImage() {
    return _cachedImage ??= const DecorationImage(
      image: AssetImage('assets/setting/inv_item_background.png'),
      fit: BoxFit.cover,
      repeat: ImageRepeat.noRepeat,
    );
  }
}
