import 'package:flutter/material.dart';
import 'package:the_cooker/model/models.dart';

import '../model/dio.dart';

class RecommendedItemController with ChangeNotifier {
  RecommendedItemController() {
    DioModel.init();
    notifyListeners();
  }

  List _recommededMealWithDetails = [];
  Future<List> getRecommendedMeals() async {
    await DioModel.getRecommededMealData().then((value) {
      _recommededMealWithDetails = (DioModel.data.values.first.map((meal) {
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
      }).toList());
    });
    notifyListeners();
    return _recommededMealWithDetails;
  }

  bool isLoading = true;
  List<MealModel> recommendedMeals = [];
  Future<List<MealModel>> recommendedItemData() async {
    for (int i = 0; i < 10; i++) {
      await getRecommendedMeals().then((value) {
        List<MealModel> meal = _recommededMealWithDetails.map((meal) {
          return MealModel(
              meal.idMeal,
              meal.mealTitle,
              meal.mealCategory,
              meal.mealArea,
              meal.mealInstruction,
              meal.mealImagePath,
              meal.tags,
              meal.mealYoutube,
              meal.mealIngredients,
              meal.mealMeasures);
        }).toList();
        recommendedMeals.addAll(meal);
        notifyListeners();
      });
    }
    isLoading = false;

    notifyListeners();

    return recommendedMeals;
  }

  MealModel getSelectedMeal(id) {
    return recommendedMeals.firstWhere((meal) => meal.idMeal == id);
  }
}
