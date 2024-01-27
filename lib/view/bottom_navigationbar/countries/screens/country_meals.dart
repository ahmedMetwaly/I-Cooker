import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../resources/values_manager.dart';
import '../../../../viewModel/country_meals_viewModel.dart';
import '../../favourite_screen/widgets/meal.dart';

class CountryMeals extends StatelessWidget {
  const CountryMeals({super.key, required this.countryTitle});
  final String countryTitle;
  @override
  Widget build(BuildContext context) {
    bool hasCalled = false;
    return Scaffold(
        appBar: AppBar(
          title: Text(countryTitle,
              style: Theme.of(context).textTheme.displayLarge),
          leadingWidth: SizeManager.s63,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(
            PaddingManager.mainPadding,
          ),
          child: Consumer<CountryMealsController>(
            builder: (context, controller, child) {
              if (hasCalled == false) {
                controller.isLoading = true;
                controller.getCountryMeals(countryTitle);
                hasCalled = true;
              }
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) => Meal(
                        meal: controller.countryMeals[index],
                        withDeleteBtn: false,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: SizeManager.s10,
                      ),
                      itemCount: controller.countryMeals.length,
                    );
            },
          ),
        )));
  }
}
