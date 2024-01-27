import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/model/models.dart';
import 'package:the_cooker/resources/constatns_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/bottom_navigationbar/home_screen/widgets/categories/image_from_network.dart';
import '../../../../viewModel/connection_checker_viewModel.dart';
import '../../../meal_view/meal_view.dart';
import 'delete_from_favourite.dart';

class Meal extends StatelessWidget {
  const Meal({super.key, required this.withDeleteBtn, required this.meal});
  final bool withDeleteBtn;
  final MealOfCategoryModel meal;
  @override
  Widget build(BuildContext context) {
    final checker = context.watch<ConnectionCheckerController>();

    return GestureDetector(
      onTap: () {
        if (checker.connected) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MealView(),
              settings: RouteSettings(name: "id", arguments: meal.id)));
        } else {
        }
      },
      child: SizedBox(
        height: SizeManager.mainContainer,
        child: Stack(alignment: Alignment.bottomRight, children: [
          Container(
            height: SizeManager.s80,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                withDeleteBtn
                    ? DeleteFromFavourite(mealId: meal.id)
                    : const SizedBox(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(PaddingManager.p8),
                    child: Text(
                      meal.mealTitle,
                      textAlign: TextAlign.center,
                      maxLines: ConstantsManager.maxLines2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Theme.of(context).canvasColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: SizeManager.s150,
                )
              ],
            ),
          ),
          Positioned(
              height: SizeManager.s100,
              width: SizeManager.s100,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(ConstantsManager.borderRadiusCard),
                child: ImageFromNetwork(
                    whiteColor: true,
                    imagePath: meal.mealImagePath,
                    width: SizeManager.s100,
                    height: SizeManager.s100),
              )),
        ]),
      ),
    );
  }
}
