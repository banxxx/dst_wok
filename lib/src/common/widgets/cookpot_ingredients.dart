import 'package:flutter/cupertino.dart';

import '../../models/recipe_example.dart';
import 'ingredient_utils.dart';

/// ---------------------- 烹饪锅食材组件 ----------------------
class CookpotIngredients extends StatelessWidget {
  final List<PositionalIngredient> slots;

  const CookpotIngredients({super.key, required this.slots});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          // 避免动态扩展操作符
          slots.length * 2 - 1,
              (index) =>
          index.isEven
              ? IngredientUtils.buildIngredientWidget(
            ingredient: slots[index ~/ 2].ingredient,
            flex: 4,
          )
              : IngredientUtils.buildAddIcon(flex: 1),
        ),
      ),
    );
  }

}