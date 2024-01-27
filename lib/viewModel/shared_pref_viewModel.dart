import "package:flutter/material.dart";
import "package:the_cooker/model/dataBase/shared_prefrences/shared_pref_model.dart";

class SharedPrefController with ChangeNotifier {
  late bool firstTime;
  
  Future checkFirstTimeOpened() async {
    await SharedPref.getBoolValuesSF("firstTime").then((value) {
      if (value == null) {
        SharedPref.addBoolToSF("firstTime", true).then((value) {
          firstTime = true;
         // print("it's first time $firstTime");
          notifyListeners();
        });
      } else {
        SharedPref.addBoolToSF("firstTime", false).then((value) {
          firstTime = false;
         // print("no it's opened before $firstTime");
          notifyListeners();
        });
      }
    });
  }
}
