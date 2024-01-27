import 'package:flutter/material.dart';

import '../../../../../resources/constatns_manager.dart';
import '../../../../../resources/values_manager.dart';
import 'ingredient.dart';
import 'measure.dart';

class IngredientWithItsMeasure extends StatelessWidget {
  const IngredientWithItsMeasure({
    super.key,
    required this.ingredient,
    required this.measure,
  });

  final String ingredient;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeManager.mainContainer,
      padding: const EdgeInsets.all(PaddingManager.p8),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(ConstantsManager.borderRadiusCard),
          boxShadow: [
             BoxShadow(
                  color: Theme.of(context)
                      .indicatorColor
                      .withOpacity(ConstantsManager.shadow),
                  blurRadius: ConstantsManager.borderRadiusCard,
                )
          ]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Ingredient(ingredient: ingredient),
            Measure(measure: measure),
          ],
        ),
      ),
    );
  }
}
