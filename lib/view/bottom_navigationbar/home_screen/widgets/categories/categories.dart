import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/categories_viewModel.dart';
import 'package:the_cooker/resources/constatns_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/bottom_navigationbar/home_screen/widgets/categories/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    bool hasCalled = false;

    return Consumer<CategoriesController>(
      builder: (context, categoriesController, child) {

        if (hasCalled == false && categoriesController.categories.isEmpty  ) {
          categoriesController.isLoading = true;
          categoriesController.getCategories();
          hasCalled = true;
        }
        return categoriesController.isLoading
            ? const SizedBox(
                height: ConstantsManager.heightOfSections,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SizedBox(
                height: ConstantsManager.heightOfSections,
                child: ListView.separated(
                  itemBuilder: (context, index) => CategoryItem(
                    category: categoriesController.categories[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: SizeManager.s10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesController.categories.length,
                ));
      },
    );
  }

  Future<bool> isConnected() async =>
      await InternetConnectionChecker().hasConnection;
}
