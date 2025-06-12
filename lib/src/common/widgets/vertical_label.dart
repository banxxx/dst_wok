import 'package:flutter/cupertino.dart';

import '../constants/app_colors.dart';

/// 竖排标签组件
class VerticalLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: _verticalLabels,
      ),
    );
  }

  static final _verticalLabels =
  '掉落自'
      .split('')
      .map(
        (char) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(
        char,
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.recipeTitle,
          height: 0.75,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  )
      .toList();

  const VerticalLabel({super.key});
}