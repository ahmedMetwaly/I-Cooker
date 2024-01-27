import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cooker/viewModel/audio_viewModel.dart';
import 'package:the_cooker/viewModel/home_viewModel.dart';
import 'package:the_cooker/viewModel/meals_of_category_viewModel.dart';
import 'package:the_cooker/viewModel/on_boarding_viewModel.dart';
import 'package:the_cooker/viewModel/recommended_viewModel.dart';
import 'package:the_cooker/viewModel/categories_viewModel.dart';
import 'package:the_cooker/viewModel/search_viewModel.dart';
import 'package:the_cooker/viewModel/shared_pref_viewModel.dart';
import 'package:the_cooker/resources/routes.dart';
import 'package:the_cooker/resources/theme_manager.dart';
import 'viewModel/connection_checker_viewModel.dart';
import 'viewModel/countries_viewModel.dart';
import 'viewModel/country_meals_viewModel.dart';
import 'viewModel/favourite_viewModel.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => OnBoardingController(),
      ),
      ChangeNotifierProvider(
        create: (context) => RecommendedItemController(),
      ),
      ChangeNotifierProvider(
        create: (context) => CategoriesController(),
      ),
      ChangeNotifierProvider(
        create: (context) => MealsOfCategoryController(),
      ),
      ChangeNotifierProvider(
        create: (context) => AudioController(),
      ),
      ChangeNotifierProvider(
        create: (context) => ContriesController(),
      ),
       ChangeNotifierProvider(
        create: (context) => CountryMealsController(),
      ),
       ChangeNotifierProvider(
        create: (context) => HomeController(),
      ),
       ChangeNotifierProvider(
        create: (context) => SearchResultController(),
      ),
      ChangeNotifierProvider(
        create: (context) => ConnectionCheckerController()..isConnected(),
      ),
       ChangeNotifierProvider(
        create: (context) => FavouriteController(),
      ),
        ChangeNotifierProvider(
        create: (context) => SharedPrefController()..checkFirstTimeOpened(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => RoutesGeneratour.getRoute(settings),
      initialRoute: Routes.splashRote,
      theme: getLightTheme(),
    );
  }
}
