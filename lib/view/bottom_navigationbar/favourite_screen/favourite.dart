import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/favourite_viewModel.dart';
import 'package:the_cooker/resources/string_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import '../search_screen/widgets/go_to_home.dart';
import 'widgets/fav_list.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(PaddingManager.p8),
          child: Text(
            StringManager.favouriteMeals,
          ),
        ),
        leading: const GoToHome(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingManager.mainPadding),
          child: Consumer<FavouriteController>(builder: (BuildContext context,
              FavouriteController controller, Widget? child) {
            if (controller.meals.isEmpty) {
              controller.finish = false;
              controller.getMeals();
            }
            return controller.finish
                ? controller.meals.isEmpty
                    ? Center(
                        child: Text(StringManager.noData,
                            style: Theme.of(context).textTheme.bodyLarge))
                    : FavListMeals(
                        meals: controller.meals,
                      )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
        ),
      ),
    );
  }
}
