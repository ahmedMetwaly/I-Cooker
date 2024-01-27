import 'package:flutter/material.dart';
import 'package:the_cooker/model/dio.dart';

class ContriesController with ChangeNotifier {
  ContriesController() {
    DioModel.init();
    notifyListeners();
  }
bool isLoading = true;
  List _countries = [];
  Future getCountries() async {
    await DioModel.getCountriesData().then((value) {
      _countries = DioModel.data.values.first.map(
        (country) => country["strArea"]
      ).toList();
     _countries.removeAt(_countries.length-2);
      isLoading = false;
      notifyListeners();
    });
  }

  List<String> get countries => _countries.cast<String>();
}
