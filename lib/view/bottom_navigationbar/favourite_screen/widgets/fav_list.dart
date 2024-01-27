import 'package:flutter/material.dart';
import 'package:the_cooker/model/models.dart';
import 'package:the_cooker/view/bottom_navigationbar/favourite_screen/widgets/meal.dart';

import '../../../../resources/values_manager.dart';

class FavListMeals extends StatelessWidget {
  const FavListMeals({super.key, required this.meals});
  final List<MealOfCategoryModel> meals;
  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
      itemBuilder: (context, index) => Meal(
          withDeleteBtn: true,
          meal: meals[index],
             ),
      separatorBuilder: (context, index) =>
          const SizedBox(height: SizeManager.s12),
      itemCount: meals.length,
    );
  }
}
