import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

 static Future<bool?> getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool(key);
    return boolValue;
  }

 static removeValues(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove bool
    prefs.remove("boolValue");
  
  }
}
