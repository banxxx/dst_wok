import 'package:dst_wok/src/common/widgets/vertical_label.dart';
import 'package:flutter/material.dart';

import '../../repositories/constants/game_assets.dart';
import '../constants/custom_colors.dart';

class BiologyIngredients extends StatelessWidget {
  final List<Ingredient> tips;

  const BiologyIngredients({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 动态计算组件高度
        final containerHeight = constraints.maxHeight;

        return Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Row(
            children: [
              const SizedBox(width: 8), // 竖排标签左侧间距
              VerticalLabel(), // 竖排标签
              const SizedBox(width: 8), // 标签与内容的间距
              // 使用 Expanded 包裹内容区域，让其占据 Row 中剩余的空间
              Expanded(child: _buildIngredientsGrid(context, containerHeight)),
            ],
          ),
        );
      },
    );
  }

  /// 构建响应式的配料网格
  Widget _buildIngredientsGrid(BuildContext context, double containerHeight) {
    // 确保最多只显示4个配料
    final displayTips = tips.take(4).toList();

    return Row(
      children: List.generate(4, (index) {
        return Expanded(
          child: Container(
            // 为了调试可以添加边框，正式使用时可以去掉
            // decoration: BoxDecoration(border: Border.all(color: Colors.red.withOpacity(0.3))),
            child:
                index < displayTips.length
                    ? _buildIngredientItem(
                      context,
                      displayTips[index],
                      containerHeight,
                    )
                    : const SizedBox(), // 空白占位符，保持4等分布局
          ),
        );
      }),
    );
  }

  /// 单个图片组件
  Widget _buildIngredientItem(
    BuildContext context,
    Ingredient ingredient,
    double containerHeight,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          // 图片容器，使用 AspectRatio 保持正方形比例
          child: AspectRatio(
            aspectRatio: 1.0, // 1:1 正方形比例
            child: FractionallySizedBox(
              widthFactor: 0.8, // 宽度占容器80%
              heightFactor: 0.8, // 高度占容器80%
              child: Image.asset(
                ingredient.imageAsset,
                fit: BoxFit.contain, // 保持图片比例，完整显示
              ),
            ),
          ),
        ),
        // const SizedBox(height: 4), // 图片和文字之间的间距
        // 文字部分使用固定高度，避免影响布局
        SizedBox(
          height: containerHeight * 0.2, // 固定文字区域高度，可以根据需要调整
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              ingredient.displayName,
              textAlign: TextAlign.center,
              maxLines: 1, // 最多显示1行
              style: TextStyle(
                fontSize: 10, // 稍微调小字体以适应布局
                color: Theme.of(context).extension<CustomColors>()!.recipeTitle,
                height: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
