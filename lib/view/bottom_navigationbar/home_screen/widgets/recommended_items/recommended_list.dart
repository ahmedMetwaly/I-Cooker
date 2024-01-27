import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/recommended_viewModel.dart';
import 'package:the_cooker/view/bottom_navigationbar/home_screen/widgets/recommended_items/recommended_item.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool hasCalled = false;
    return Consumer<RecommendedItemController>(
      builder: (context, controller, child) {
        if (hasCalled == false && controller.recommendedMeals.isEmpty) {
          controller.isLoading = true;
          controller.recommendedItemData();
          hasCalled = true;
        }
        return controller.isLoading
            ? const Expanded(
                child: Center(
                child: CircularProgressIndicator(),
              ))
            : Expanded(
                child: ListView.builder(
                itemBuilder: (context, index) =>
                    RecommendedMeal(meal: controller.recommendedMeals[index]),
                itemCount: controller.recommendedMeals.length,
                scrollDirection: Axis.horizontal,
              ));
      },
    );
  }
}
