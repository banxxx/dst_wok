
import 'package:flutter/cupertino.dart';

import '../../common/enums/cooking_method.dart';
import 'method_selector_button.dart';

/// 烹饪方式选择器组件
class MethodSelector extends StatelessWidget {
  final PageController? pageController; // 新增控制器关联
  final CookingMethod currentMethod;
  final ValueChanged<CookingMethod> onMethodChanged;

  const MethodSelector({
    super.key,
    required this.currentMethod,
    required this.onMethodChanged,
    this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        children: CookingMethod.values.map((method) {
          return GestureDetector(
            onTap: () {
              onMethodChanged(method);
              pageController?.animateToPage( // 点击时切换页面
                method.index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },

            child: MethodSelectorButton(
              method: method,
              imageAsset: _getAssetPath(method),
              isSelected: currentMethod == method,
              onTap: () => onMethodChanged(method),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getAssetPath(CookingMethod method) {
    switch (method) {
      case CookingMethod.campfire:
        return 'assets/setting/campfire.png';
      case CookingMethod.crockPot:
        return 'assets/setting/cookpot.png';
      case CookingMethod.portableCooker:
        return 'assets/setting/portablecookpot.png';
    }
  }
}