import 'package:flutter/material.dart';

import '../../repositories/constants/game_assets.dart';


class TextParserUtil {
  /// 解析带有[img:xxx]标记的文本为InlineSpan集合
  /// [text] 原始文本
  /// [imgPathPrefix] 图片路径前缀
  /// [imgSize] 图片尺寸（默认24x24）
  static List<InlineSpan> parseCondition(
    String text, {
    double imgSize = 24,
    TextStyle? textStyle,
  }) {
    final List<InlineSpan> spans = [];
    final RegExp exp = RegExp(r'\[img:(.*?)\]');

    // 使用 splitMapJoin 精准分割
    text.splitMapJoin(
      exp,
      onMatch: (Match match) {
        final id = match.group(1)!;

        // 使用 GameAssets 统一解析路径
        final path = GameAssets.getImagePath(id);
        spans.add(_buildImageSpan(path, imgSize));
        return ''; // 返回空字符串避免重复拼接
      },
      onNonMatch: (String nonMatch) {
        if (nonMatch.isNotEmpty) {
          spans.add(TextSpan(text: nonMatch, style: textStyle));
        }
        return '';
      },
    );

    return spans;
  }

  // 构建图片WidgetSpan
  static WidgetSpan _buildImageSpan(String path, double size) {
    return WidgetSpan(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            path,
            width: size,
            height: size,
            errorBuilder:
                (ctx, error, stack) => Icon(Icons.image_not_supported), // 错误处理
          ),
        ],
      ),
      // alignment: PlaceholderAlignment.middle,
    );
  }

  // 错误占位符（可选）
  static WidgetSpan _buildErrorPlaceholder(double size) {
    return WidgetSpan(
      child: Icon(Icons.image_not_supported, size: size),
    );
  }
}
