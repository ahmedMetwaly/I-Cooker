import 'package:flutter/material.dart';
import 'package:the_cooker/model/models.dart';
import 'package:the_cooker/resources/constatns_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/bottom_navigationbar/home_screen/widgets/categories/image_from_network.dart';
import '../../../../meal_view/meal_view.dart';

class RecommendedMeal extends StatelessWidget {
  const RecommendedMeal({super.key, required this.meal});
  final MealModel meal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => const MealView()),
            settings: RouteSettings(name :"meal",arguments:  meal)));
      },
      child: Stack(
        children: [
          Container(
            width: SizeManager.s200,
            margin: const EdgeInsets.only(
                top: MarginManager.m30, right: MarginManager.m20, bottom: MarginManager.m10, left: MarginManager.m30),
            padding: const EdgeInsets.all(PaddingManager.p10),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius:
                  BorderRadius.circular(ConstantsManager.borderRadiusCard),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context)
                      .indicatorColor
                      .withOpacity(ConstantsManager.shadow),
                  blurRadius: ConstantsManager.borderRadiusCard,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: SizeManager.s8,
                ),
                Text(
                  meal.mealTitle,
                  maxLines: ConstantsManager.maxLines2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(meal.mealCategory),
                const SizedBox(
                  height: SizeManager.s10,
                ),
              ],
            ),
          ),
          Positioned(
              right: SizeManager.s100,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(ConstantsManager.borderRadiusCard),
                child: ImageFromNetwork(
                    imagePath: meal.mealImagePath,
                    width: SizeManager.s100,
                    height: SizeManager.s100),
              )),
        ],
      ),
    );
  }
}
