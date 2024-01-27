import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionCheckerController with ChangeNotifier {
  late bool connected;

  Future isConnected() async {
    await InternetConnectionChecker().hasConnection.then((value) async {
      connected = value;
      notifyListeners();
      //print("isConnected : $connected");
    });
  }
}
