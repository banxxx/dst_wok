import 'package:flutter/cupertino.dart';

import '../constants/app_colors.dart';
import '../utils/TextParserUtil.dart';

/// 通用图文混排组件
/// [label] 左侧标签（如"特殊效果"）
/// [content] 包含图片标记的内容（如"效果[img:fire]"）
/// [labelStyle] 标签文本样式（必须包含颜色）
/// [contentStyle] 内容基础样式（可继承labelStyle的颜色）
/// [imageConfig] 图片配置（路径前缀、尺寸等）
class RichLabelContent extends StatelessWidget {
  final String label;
  final String content;
  final TextStyle labelStyle;
  final TextStyle? contentStyle;
  final ImageParserConfig imageConfig;

  const RichLabelContent({
    super.key,
    required this.label,
    required this.content,
    required this.labelStyle,
    this.contentStyle,
    this.imageConfig = const ImageParserConfig(),
  });

  @override
  Widget build(BuildContext context) {
    // 合并样式：内容默认继承标签颜色
    final effectiveContentStyle = (contentStyle ?? TextStyle()).copyWith(
      color: contentStyle?.color ?? labelStyle.color,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 左侧标签
        Text(
          "$label: ",
          style: labelStyle.copyWith(
            fontSize: labelStyle.fontSize ?? 18,
            fontWeight: labelStyle.fontWeight ?? FontWeight.bold,
          ),
        ),
        // 右侧内容
        Expanded(
          child: RichText(
            text: TextSpan(
              style: effectiveContentStyle.copyWith(
                fontSize: effectiveContentStyle.fontSize ?? 16,
                fontWeight: effectiveContentStyle.fontWeight ?? FontWeight.w400,
              ),
              children: TextParserUtil.parseCondition(
                content,
                textStyle: TextStyle(color: AppColors.recipeTitle),
                imgSize: imageConfig.size,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 图片配置项
class ImageParserConfig {
  final double size;        // 图片显示尺寸

  const ImageParserConfig({
    this.size = 24,
  });
}