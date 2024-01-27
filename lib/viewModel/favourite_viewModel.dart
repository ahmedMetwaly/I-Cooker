// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../model/dataBase/local/local.dart';
import '../model/dio.dart';
import '../model/models.dart';

class FavouriteController with ChangeNotifier {
  late Database database;
  bool isLoading = true;
  List favIds = [];

  FavouriteController() {
    LocalDatabase.createLocalDatabase().then((value) {
      database = value;
      notifyListeners();
      _getFavMealsIds();
      getMeals();

     // print("created $database");
    });
    notifyListeners();
  }

  Future _getFavMealsIds() async {
    isLoading = true;
    favIds = await LocalDatabase.getFavMealsIdsData(database);
    isLoading = false;
    //print("FavIds: $favIds");

    notifyListeners();
  }

  Future _insertFavMealId(String idMeal) async {
    isLoading = true;
    await LocalDatabase.insertFavMealIdData(database, idMeal);
    await _getFavMealsIds();
    await getMeals();
    notifyListeners();
  }

  Future deleteFavMealId(String id) async {
    isLoading = true;
    await LocalDatabase.deleteFavMealIdData(database, id);
    await _getFavMealsIds();
    await getMeals();

    isLoading = false;
    notifyListeners();
  }

  Future save(String idMeal) async {
    if (!favIds.contains(idMeal)) {
      await _insertFavMealId(idMeal);
      notifyListeners();
    } else {
      await deleteFavMealId(idMeal);
      // await _getFavMealsIds();

      notifyListeners();
    }
  }

  //List _mealDetails = [];
  bool gettingData = true;

  Future<List> _getMealDetails(id) async {
    List mealDetails = [];
    await DioModel.getMealDetailsById(id).then((value) {
      mealDetails = (DioModel.data.values.first
          .map((meal) {
            List mealIngredients = [];
            List mealMeasures = [];
            for (int i = 1; i <= 20; i++) {
              mealIngredients.add(meal["strIngredient$i"]);
              mealMeasures.add(meal["strMeasure$i"]);
              mealIngredients =
                  mealIngredients.where((element) => element != "").toList();
              mealMeasures =
                  mealMeasures.where((element) => element != "").toList();
              notifyListeners();
            }
            return MealOfCategoryModel(
              meal["idMeal"],
              meal["strMeal"],
              meal["strMealThumb"],
            );
          })
          .toList()
          .cast<MealOfCategoryModel>());
      gettingData = false;
      notifyListeners();
    });
    return mealDetails;
  }

  bool finish = false;
  List<MealOfCategoryModel> meals = [];
  Future<List<MealOfCategoryModel>> getMeals() async {
    meals = [];
    for (int i = 0; i < favIds.length; i++) {
      meals.add(await _getMealDetails(favIds[i])
          .then((value) => value.first as MealOfCategoryModel));
    }
    finish = true;
    //notifyListeners();
   // print(meals);
    return meals;
  }
}
