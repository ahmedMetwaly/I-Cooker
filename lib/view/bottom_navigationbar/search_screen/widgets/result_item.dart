import 'package:flutter/material.dart';
import 'package:the_cooker/model/models.dart';
import 'package:the_cooker/resources/constatns_manager.dart';
import 'package:the_cooker/resources/fonts_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/bottom_navigationbar/home_screen/widgets/categories/image_from_network.dart';
import 'package:the_cooker/view/meal_view/meal_view.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({super.key, required this.result});
  final RecommendedMealModel result;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MealView(),
          settings: RouteSettings(name: "id", arguments: result.id))),
      child: Container(
        height: SizeManager.mainContainer,
        width: double.infinity,
        padding: const EdgeInsets.all(PaddingManager.p8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius:
              BorderRadius.circular(ConstantsManager.borderRadiusCard),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result.mealTitle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).canvasColor,
                        ),
                  ),
                  Text(
                    result.mealCategory,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).canvasColor,
                        fontSize: FontSizeManager.fs16),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(ConstantsManager.borderRadiusCard),
              child: ImageFromNetwork(
                imagePath: result.mealImage,
                width: SizeManager.mainContainer,
                height: SizeManager.mainContainer,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
