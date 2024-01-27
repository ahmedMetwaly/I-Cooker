import 'package:flutter/material.dart';
import 'package:the_cooker/model/models.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'widgets/ingredients_with_its_measure.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({super.key, required this.meal});
  final MealIngredientsWithItsMeasureModel meal;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding:
          const EdgeInsets.symmetric(horizontal: PaddingManager.mainPadding),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => IngredientWithItsMeasure(
          ingredient: meal.ingredients[index].toString(),
          measure: meal.measures[index].toString()),
      separatorBuilder: (context, index) => const SizedBox(
        height: SizeManager.s10,
      ),
      itemCount: meal.ingredients.length > meal.measures.length
          ? meal.ingredients.length
          : meal.measures.length,
    );
  }
}
