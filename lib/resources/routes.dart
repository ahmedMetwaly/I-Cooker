import 'package:flutter/material.dart';
import 'package:the_cooker/resources/string_manager.dart';

import 'package:the_cooker/view/bottom_navigationbar/favourite_screen/favourite.dart';
import 'package:the_cooker/view/bottom_navigationbar/home_screen/home_screen.dart';
import 'package:the_cooker/view/home/home.dart';
import 'package:the_cooker/view/meal_view/meal_view.dart';
import 'package:the_cooker/view/connection_checker/connection_checker.dart';
import 'package:the_cooker/view/onboarding/onboarding_screen.dart';
import 'package:the_cooker/view/splashScreen/splash_screen.dart';

import '../view/bottom_navigationbar/countries/screens/countries.dart';
import '../view/bottom_navigationbar/search_screen/search.dart';
import '../view/category/category_meals.dart';

class Routes {
  static const String splashRote = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String homePage = "/homePage";
  static const String homeScreen = "/homeScreen";
  static const String category = "/category";
  static const String search = "/search";
  static const String meals = "/meals";
  static const String favourite = "/favourite";
  static const String itemVeiw = "/itemView";
  static const String ingredients = "/ingredients";
  static const String connectionChecker = "/connectionChecker";
}

class RoutesGeneratour {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRote:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const Home());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.category:
        return MaterialPageRoute(builder: (_) => const CategoryMeals());

      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case Routes.meals:
        return MaterialPageRoute(builder: (_) => const CountriesScreen());

      case Routes.favourite:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());

      case Routes.itemVeiw:
        return MaterialPageRoute(builder: (_) => const MealView());

      case Routes.connectionChecker:
        return MaterialPageRoute(builder: (_) => const ConnectionChecker());

      default:
        return unFoundedRoute();
    }
  }

  static Route<dynamic> unFoundedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text(StringManager.noRoute)),
              body: const Center(child: Text(StringManager.noRouteBody)),
            ));
  }
}
