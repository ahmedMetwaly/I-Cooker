import 'package:flutter/material.dart';
import '../model/dio.dart';
import '../model/models.dart';

class CategoriesController with ChangeNotifier {
  CategoriesController() {
    DioModel.init();
    notifyListeners();
  }
  bool isLoading = true;
  List _categoriesData = [];
  Future<List> getCategories() async {
    await DioModel.getCategoriesData().then((value) {
      _categoriesData = DioModel.data.values.first
          .map((category) => CategoryModel(
              category["idCategory"],
              category["strCategory"],
              category["strCategoryThumb"],
              category["strCategoryDescription"]))
          .toList();
      isLoading = false;
      notifyListeners();
      return _categoriesData;
    });
    return _categoriesData;
    // print( DioModel.data.values.first);
  }

  List get categories => _categoriesData;
}
