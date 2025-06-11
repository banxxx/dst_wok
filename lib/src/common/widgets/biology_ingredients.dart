import 'package:dst_wok/src/common/widgets/vertical_label.dart';
import 'package:flutter/cupertino.dart';

import '../../repositories/constants/game_assets.dart';

class BiologyIngredients extends StatelessWidget {
  final List<Ingredient> tips;

  const BiologyIngredients({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row( // 仍然保留外部的 Row，用于放置竖排标签和 Wrap
        children: [
          const SizedBox(width: 8), // 竖排标签左侧间距
          VerticalLabel(), // 竖排标签
          const SizedBox(width: 4), // 标签与 Wrap 的间距
          // 使用 Expanded 包裹 Wrap，让 Wrap 占据 Row 中剩余的空间
          Expanded(
            child: Align( // Align 将 Wrap 居中对齐 (如果Wrap没有填满Expanded空间)
              alignment: Alignment.centerLeft, // 默认左对齐，如果需要居中可以改为 Alignment.center
              child: Wrap(
                spacing: 8.0, // 水平方向子组件之间的间距
                runSpacing: 8.0, // 垂直方向换行之间的间距
                alignment: WrapAlignment.start, // 子组件在主轴方向上的对齐方式 (start, center, end)
                // crossAxisAlignment: WrapCrossAlignment.center, // 子组件在交叉轴方向上的对齐方式
                children: tips.map((ingredient) {
                  // 构建单个图片组件，放在 Wrap 中
                  return _buildDynamicImage(context, ingredient);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 单个图片组件（可以保持原实现，或者根据需要调整大小）
  Widget _buildDynamicImage(BuildContext context,Ingredient ingredient) {
    // 你可以根据需要调整这里的图片大小，例如使用 LayoutBuilder 获取可用宽度来动态计算
    // 但通常对于 Wrap，固定大小的子组件效果更好，Wrap 会自动换行
    return Image.asset(
      ingredient.imageAsset,
      width: 40, // 适当减小图片大小，以便在 Wrap 中排列更多图片
      height: 40,
      cacheWidth: (40 * MediaQuery.of(context).devicePixelRatio).round(),
      cacheHeight: (40 * MediaQuery.of(context).devicePixelRatio).round(),
      filterQuality: FilterQuality.low,
    );
  }

}