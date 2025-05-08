import 'package:flutter/material.dart';
import '../../common/widgets/ingredient_utils.dart';
import '../../models/recipe_example.dart';

class RecipeRecommendation extends StatelessWidget {
  final List<PositionalIngredient> slots;

  const RecipeRecommendation({
    super.key,
    required this.slots,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < slots.length; i++) ...[
                IngredientUtils.buildIngredientWidget(
                  ingredient: slots[i].ingredient,
                    imageSize: 38,
                    containerSize:52
                ),
                if (i != slots.length - 1)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      bottom: 16,
                    ),
                    child: Image.asset(
                      'assets/setting/add.png',
                      width: 16,
                      height: 16,
                    ),
                  ),
              ],
            ],
          );
        },
      ),
    );
  }
}