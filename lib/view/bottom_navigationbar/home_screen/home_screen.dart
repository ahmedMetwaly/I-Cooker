import 'package:flutter/material.dart';
import 'package:the_cooker/resources/string_manager.dart';
import 'package:the_cooker/resources/values_manager.dart';
import 'package:the_cooker/view/bottom_navigationbar/home_screen/widgets/recommended_items/recommended_list.dart';
import 'package:the_cooker/view/bottom_navigationbar/home_screen/widgets/searchbar/searcbar_home.dart';
import 'package:the_cooker/view/bottom_navigationbar/home_screen/widgets/categories/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(PaddingManager.mainPadding),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: SizeManager.s25,
                  ),
                  Text(
                    StringManager.homeTitle1,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: SizeManager.s25,
                  ),
                  const SearchBarNavigation(),
                  const SizedBox(
                    height: SizeManager.s25,
                  ),
                  Text(StringManager.categories,
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(
                    height: SizeManager.s16,
                  ),
                  const Categories(),
                  const SizedBox(
                    height: SizeManager.s25,
                  ),
                  Text(StringManager.recommended,
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(
                    height: SizeManager.s25,
                  ),
                  const RecommendedList(),
                ])));
  }
}
