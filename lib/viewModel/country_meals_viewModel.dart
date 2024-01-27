import 'package:flutter/material.dart';
import 'package:the_cooker/model/dio.dart';
import 'package:the_cooker/model/models.dart';

class CountryMealsController with ChangeNotifier {
  CountryMealsController() {
    DioModel.init();
    notifyListeners();
  }

  bool isLoading = true;
  List _countryMeals = [];
  Future<List> getCountryMeals(String country) async {
    await DioModel.getCountryMealsData(country).then((value) {
      _countryMeals = DioModel.data.values.first
          .map((meal) => MealOfCategoryModel(
              meal["idMeal"], meal["strMeal"], meal["strMealThumb"]))
          .toList();
      isLoading = false;
      notifyListeners();
      return _countryMeals;
    });
    return _countryMeals;
  }

  List<MealOfCategoryModel> get countryMeals =>
      _countryMeals.cast<MealOfCategoryModel>();
}
