import "package:flutter/material.dart";
import "package:the_cooker/model/dio.dart";
import "package:the_cooker/model/models.dart";

class SearchResultController with ChangeNotifier {
  SearchResultController() {
    DioModel.init();
    notifyListeners();
  }

  bool isLoading = true;
  List _searchResults = [];
  Future<List> _getSearchResult(String meal) async {
    await DioModel.search(meal).then((value) async {
     // print(DioModel.data.values);
      if (DioModel.data.values.first != null &&
          DioModel.data.values.first.isNotEmpty) {
        _searchResults = await DioModel.data.values.first.map((result) {
          List mealIngredients = [];
          List mealMeasures = [];
          for (int i = 1; i <= 20; i++) {
            mealIngredients.add(result["strIngredient$i"]);
            mealMeasures.add(result["strMeasure$i"]);
            mealIngredients =
                mealIngredients.where((element) => element != "").toList();
            mealMeasures =
                mealMeasures.where((element) => element != "").toList();
            notifyListeners();
          }
          return MealModel(
              result["idMeal"],
              result["strMeal"],
              result["strCategory"],
              result["strArea"],
              result["strInstructions"],
              result["strMealThumb"],
              result["strTags"],
              result["strYoutube"],
              mealIngredients,
              mealMeasures);
        }).toList();
      }
      //print("result:$_searchResults");
      notifyListeners();
    });
    return _searchResults;
  }

  List<RecommendedMealModel> _searchResultView = [];
  Future<List> getSearchResultView(String meal) async {
    _searchResultView=[];
    isLoading =true;
    await _getSearchResult(meal).then((value) {
      _searchResultView = searchResults
          .map((result) => RecommendedMealModel(result.idMeal, result.mealTitle,
              result.mealCategory, result.mealImagePath))
          .toList();
    });
    isLoading = false;
    notifyListeners();
    return _searchResultView;
  }

  MealModel getSpecificMealResult(id) =>
      searchResults.firstWhere((element) => element.idMeal == id);

  List<MealModel> get searchResults => _searchResults.cast<MealModel>();

  List<RecommendedMealModel> get searchResultView => _searchResultView;
}
