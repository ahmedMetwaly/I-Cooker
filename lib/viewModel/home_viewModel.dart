import 'package:flutter/material.dart';
import '../view/bottom_navigationbar/countries/screens/countries.dart';
import '../view/bottom_navigationbar/favourite_screen/favourite.dart';
import '../view/bottom_navigationbar/home_screen/home_screen.dart';
import '../view/bottom_navigationbar/search_screen/search.dart';

class HomeController with ChangeNotifier {
  int index =1;
  PageController pageController = PageController(initialPage: 1);
  final List<Widget> screens = const [
    SearchScreen(),
        HomeScreen(),

    CountriesScreen(),
    FavouriteScreen(),
  ];

  void changePage(int pageIndex) {
    index = pageIndex;
    pageController.jumpToPage(pageIndex);
    notifyListeners();
  }
}
