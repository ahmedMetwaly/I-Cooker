import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/meals_of_category_viewModel.dart';
import 'package:the_cooker/model/models.dart';
import 'package:the_cooker/resources/string_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/bottom_navigationbar/home_screen/widgets/categories/image_from_network.dart';
import 'package:the_cooker/view/meal_view/screens/ingredients/ingredients.dart';
import 'widgets/fab.dart';
import 'widgets/fav_btn.dart';
import 'widgets/loading_page.dart';

class MealView extends StatelessWidget {
  const MealView({super.key});
  @override
  Widget build(BuildContext context) {
    late MealModel meal;
    bool hasCalled = false;

    //final checker = context.watch<ConnectionCheckerController>();
    dynamic isOpen = ValueNotifier(false);
    return Consumer<MealsOfCategoryController>(
      builder: (BuildContext context, MealsOfCategoryController controller,
          Widget? child) {
        //checker.isConnected();
      //  if (checker.connected) {
          if (hasCalled == false &&
              ModalRoute.of(context)?.settings.name == "meal") {
            meal = ModalRoute.of(context)?.settings.arguments as MealModel;
            hasCalled = true;
          } else if (hasCalled == false &&
              ModalRoute.of(context)?.settings.name == "id") {
            var id = ModalRoute.of(context)?.settings.arguments;
            controller
                .getMealById(id)
                .then((value) => meal = controller.mealById);
            hasCalled = true;
          }
       // }

        return /* checker.connected
            ? */ controller.isLoading &&
                    ModalRoute.of(context)?.settings.name == "id"
                ? const LoadingPage()
                : Scaffold(
                    appBar: AppBar(
                        title: Text(
                      meal.mealTitle,
                    )),
                    body: SafeArea(
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: SizeManager.s10,
                          ),
                          Stack(children: [
                            ImageFromNetwork(
                                imagePath: meal.mealImagePath,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.25),
                            FavouriteBtn(id: meal.idMeal),
                          ]),
                          const SizedBox(
                            height: SizeManager.s16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: PaddingManager.mainPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(StringManager.ingredients,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                                Text(StringManager.measures,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                              ],
                            ),
                          ),
                          Ingredients(
                            meal: MealIngredientsWithItsMeasureModel(
                                meal.idMeal,
                                meal.mealTitle,
                                meal.mealIngredients,
                                meal.mealMeasures,
                                meal.mealImagePath),
                          ),
                          const SizedBox(
                            height: SizeManager.s35,
                          ),
                        ],
                      ),
                    ),
                    floatingActionButton: FAB(isOpen: isOpen, meal: meal),
                  );
           // : const ConnectionChecker();
      },
    );
  }
}
