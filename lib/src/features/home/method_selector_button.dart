import 'package:flutter/material.dart';
import '../../common/enums/cooking_method.dart';

/// 烹饪方式选择器组件样式
class MethodSelectorButton extends StatelessWidget {

  static const _containerSize = 48.0;
  static const _borderWidth = 2.5;
  static const _padding = EdgeInsets.symmetric(horizontal: 8);
  static const _imagePadding = EdgeInsets.all(6);
  static const _selectedShadow = [
    BoxShadow(
      color: Colors.black26,
      spreadRadius: 2.0,
      blurRadius: 8.0,
      offset: Offset(0, 2),
    )
  ];

  // 构造函数参数说明
  final CookingMethod method;    // 当前按钮代表的烹饪方式
  final String imageAsset;       // 按钮图片资源路径
  final bool isSelected;         // 是否处于选中状态
  final VoidCallback onTap;      // 点击事件回调函数

  const MethodSelectorButton({
    super.key,
    required this.method,
    required this.imageAsset,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: _padding,
      child: InkWell(
        borderRadius: BorderRadius.circular(_containerSize/2),
        // 点击事件绑定
        onTap: onTap,
        child: Container(
                width: _containerSize,  // 容器直径
                height: _containerSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,   // 圆形形状
                  color: Colors.grey[200],  // 背景颜色
                  border: Border.all(
                    color: isSelected
                        ? theme.primaryColor // 选中状态边框颜色
                        : Colors.transparent,           // 未选中透明边框
                    width: _borderWidth,            // 边框宽度
                  ),
                  boxShadow: isSelected ? _selectedShadow : null,
                ),
                // 图片内边距
                padding: _imagePadding,
                child: Image.asset(
                  imageAsset,
                  filterQuality: FilterQuality.low, // 图片渲染质量
                  cacheWidth: 96,
                  cacheHeight: 96,
                  fit: BoxFit.contain,               // 图片适应方式
                ),
              ),
            // ],
        //   ),
        // ),
      ),
    );
  }
}