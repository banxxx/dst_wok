import 'package:flutter/material.dart';

import '../../repositories/constants/game_assets.dart';
import '../constants/app_colors.dart';

class IngredientUtils {
  /// 通用食材图片构建方法
  static Widget buildIngredientWidget({
    required Ingredient? ingredient,
    double imageSize = 32,
    double containerSize = 42,
    TextStyle? textStyle, // 可选自定义文字样式
  }) {
    return ConstrainedBox( // 改用约束盒子
      constraints: BoxConstraints.tightFor(width: containerSize),
      child: _IngredientContent( // 拆分内部组件
        ingredient: ingredient,
        imageSize: imageSize,
        containerSize: containerSize,
        textStyle: textStyle,
      ),
    );
  }

  // 默认文字样式（私有方法）
  static TextStyle _defaultTextStyle() {
    return const TextStyle(
      fontSize: 12,
      color: AppColors.recipeTitle,
    ).copyWith(
      fontFeatures: const [FontFeature.tabularFigures()], // 优化文本渲染性能
    );
  }

  /// 核心图片容器（独立组件）
  static Widget buildImageContainer({
    required Ingredient? ingredient,
    double imageSize = 32,
    double containerSize = 42,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: containerSize),
      child: _IngredientContent(
        ingredient: ingredient,
        imageSize: imageSize,
        containerSize: containerSize,
      ),
    );
  }

  /// 加号图标构建方法（新增）
  static Widget buildAddIcon({
    double iconSize = 16,
    double containerSize = 42,
    double horizontalPadding = 2,
  }) {
    return RepaintBoundary(
      child: SizedBox(
        height: containerSize, // 对齐参数
        child: Align(
        alignment: Alignment.topCenter, // 顶部居中
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Image.asset(
                'assets/setting/add.png',
                width: iconSize,
                height: iconSize,
                cacheWidth: (iconSize * 2).round(),
                cacheHeight: (iconSize * 2).round(),
              ),
          ),
        ),
      ),
    );
  }
}


/// -------------------- 内部组件拆分 --------------------
class _IngredientContent extends StatelessWidget {
  final Ingredient? ingredient;
  final double imageSize;
  final double containerSize;
  final TextStyle? textStyle;

  const _IngredientContent({
    required this.ingredient,
    required this.imageSize,
    required this.containerSize,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (ingredient == null) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildImageContainer(),
        const SizedBox(height: 4),
        _buildTextLabel(),
      ],
    );
  }

  /// 图片容器（添加缓存策略）
  Widget _buildImageContainer() {
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        image: _BackgroundCache.getImage(), // 使用缓存装饰图
      ),
      child: RepaintBoundary( // 避免连带重绘
        child: Center(
          child: Image.asset(
            ingredient!.imageAsset,
            width: imageSize,
            height: imageSize,
            cacheWidth: (imageSize * 2).round(), // 根据设备像素比优化
            cacheHeight: (imageSize * 2).round(),
            filterQuality: FilterQuality.low,    // 降低过滤质量
            isAntiAlias: false,                  // 关闭抗锯齿
            excludeFromSemantics: true,          // 跳过语义分析
          ),
        ),
      )
    );
  }

  /// 文本标签（添加布局约束）
  Widget _buildTextLabel() {
    return SizedBox(
      width: containerSize - 4,
      child: Text(
        ingredient!.displayName,
        style: textStyle ?? IngredientUtils._defaultTextStyle(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        textScaleFactor: 1.0, // 禁止系统缩放
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