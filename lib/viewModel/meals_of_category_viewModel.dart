import 'package:flutter/material.dart';
import 'package:the_cooker/model/dio.dart';

import '../model/models.dart';

class MealsOfCategoryController with ChangeNotifier {
  MealsOfCategoryController() {
    DioModel.init();
    notifyListeners();
  }
  bool isLoading = true;
  List mealsOfCategoryData = [];
  Future getMealsOfCategory(String categoryName) async {
    isLoading = true;
    await DioModel.getMealsOfCategoryData(categoryName).then((value) {
      mealsOfCategoryData = DioModel.data.values.first
          .map((meal) => MealOfCategoryModel(
              meal["idMeal"], meal["strMeal"], meal["strMealThumb"]))
          .toList();
      isLoading = false;
      notifyListeners();
    });
    // print(_mealsOfCategoryData);
  }

  List _mealById = [];
  Future getMealById(id) async {
    isLoading = true;
    await DioModel.getMealDetailsById(id).then((value) {
      _mealById = DioModel.data.values.first.map((meal) {
        List mealIngredients = [];
        List mealMeasures = [];
        for (int i = 1; i <= 20; i++) {
          mealIngredients.add(meal["strIngredient$i"]);
          mealMeasures.add(meal["strMeasure$i"]);
          mealIngredients = mealIngredients
              .where((element) =>
                  element.toString().trim() != "" &&
                  element.toString().trim() != "null")
              .toList();

          mealMeasures = mealMeasures
              .where((element) =>
                  element.toString().trim() != "" &&
                  element.toString().trim() != "null")
              .toList();
          notifyListeners();
        }
        isLoading = false;
        notifyListeners();
        return MealModel(
            meal["idMeal"],
            meal["strMeal"],
            meal["strCategory"],
            meal["strArea"],
            meal["strInstructions"],
            meal["strMealThumb"],
            meal["strTags"],
            meal["strYoutube"],
            mealIngredients,
            mealMeasures);
      }).toList();
      notifyListeners();
    });
  }

  MealModel get mealById => _mealById.first;
}
