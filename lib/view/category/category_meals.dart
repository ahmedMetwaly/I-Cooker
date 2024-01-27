import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/connection_checker_viewModel.dart';
import 'package:the_cooker/viewModel/meals_of_category_viewModel.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/bottom_navigationbar/favourite_screen/widgets/meal.dart';
import 'package:the_cooker/view/connection_checker/connection_checker.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({super.key});

  @override
  Widget build(BuildContext context) {
    String categoryTitle =
        ModalRoute.of(context)!.settings.arguments.toString();
    bool hasCalled = false;
    return Consumer<ConnectionCheckerController>(
      builder: (BuildContext context, ConnectionCheckerController checker,
          Widget? child) {
        checker.isConnected();
        return checker.connected
            ? Scaffold(
                appBar: AppBar(
                  title: Text(
                    categoryTitle,
                  ),
                  leadingWidth: SizeManager.s63,
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(PaddingManager.mainPadding),
                    child: Consumer<MealsOfCategoryController>(
                      builder: (context, controller, child) {
                        if (hasCalled == false) {
                          controller.getMealsOfCategory(categoryTitle);
                          hasCalled = true;
                        }
                        return controller.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.separated(
                                itemBuilder: (context, index) => Meal(
                                  meal: controller.mealsOfCategoryData[index],
                                  withDeleteBtn: false,
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: SizeManager.s10,
                                ),
                                itemCount:
                                    controller.mealsOfCategoryData.length,
                              );
                      },
                    ),
                  ),
                ),
              )
            : ConnectionChecker(screen: CategoryMeals());
      },
    );
  }
}
